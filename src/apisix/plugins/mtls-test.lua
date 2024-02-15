local core = require("apisix.core")
local ssl = require("ngx.ssl")

local plugin_name = "mtls-test"

local schema = {
    type = "object",
    properties = {
        cert_chain = {
            type = "string"
        },
        private_key = {
            type = "string"
        },
    },
    required = {"cert_chain", "private_key"}
}

local metadata_schema = {}

local _M = {
    version = 0.1,
    priority = 1,
    name = plugin_name,
    schema = schema,
    metadata_schema = metadata_schema
}


function _M.check_schema(conf, schema_type)
    if schema_type == core.schema.TYPE_METADATA then
        return core.schema.check(metadata_schema, conf)
    end
    return core.schema.check(schema, conf)
end

function _M.access(conf, ctx)

    local cert = assert(ssl.parse_pem_cert(conf.cert_chain))
    local key = assert(ssl.parse_pem_priv_key(conf.private_key))

    local httpc = assert(require('resty.http').new())

    local ok, err = httpc:connect {
        scheme = 'https',
        host = 'unix:/usr/local/apisix/internal.sock',
        ssl_verify = false,
        ssl_client_cert = cert,
        ssl_client_priv_key = key,
    }

    if err ~= nil then
        core.log.error("connect error: ", err)
    end

    if ok and not err then
        local res, err = assert(httpc:request {
            method = 'GET',
            path = '/test',
            headers = {
                ['Host'] = 'test.server',
            },
        })

        if err ~= nil then
            core.log.error(err)
            return false, err, true
        end

        if res.status ~= 200 then
            return res.status, res:read_body()
        end

    end

    httpc:close()
end



return _M