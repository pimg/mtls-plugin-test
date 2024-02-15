local http = require("resty.http")
local ssl           = require("ngx.ssl")

local httpc, err = http.new()
if err ~= nil then
	ngx.log(ngx.ERROR, "cannot instantiate http client" .. err)
end

local conf = {}
conf.internal_key = [[
-----BEGIN RSA PRIVATE KEY-----
MIIJKAIBAAKCAgEAxhGAc01mjzZlbh8Y3RKWWU/Qfl7DLuKXo/MUrdHox4sN4+1w
+90ZECdYt3iIj1fmq2BKe/lYuoAAfH/fvbQ5B2A7TQ9V25zUuQF1yduCEljlKxz1
ilbiV3FHMLwCTUQnuSKoTgDWRP5LWTGMPwFG8TiSsqpaxIS59YxqH7VeGgmW/poC
fxspLeKBk+T9zVEWdJ/CR03ohxknK78BB8t2W87BXj1YYizvxEjZueoaStaGfxk/
wHDHUCZ+SQiEncKG+sIkTLRVfvcnOdc93xZ65MQ0RcXVRWpfiISYrNQzaBP3yCGb
l628FIfUDpoIFvMsigdCDBDx1cgl6e0wt4GoGsez0fE1Od08ZrtwLP4FNUm7THbm
k516G/69dLhABizwF97cU+0aNquGZQ7UqqVYgqw2THZOzduxwNyAls9IME3U8+r0
w2LXfhOpRs9KOjoo+quihf+KoYGI1RYpxOnTj/S/53iWh5Zl+/Mp5pCSR3Fueqiq
aCdCwklHIkKZca8aPeT63HatoPvTjBvvdnuPv5yCchmCM40EyCHoKu2qcpGC1n0F
PMq+QJZ6CJh+LmY1KsBBpbPsvzEDYTo6CGnWE3Hii63o+CHDV8eh3vfrtf8YQVJc
EoN4umU6VGV0pS/tTCqtLSsNpQZ9uevuepajDnu0DilHC/gK+u3zCzUIxK8CAwEA
AQKCAgArh38mV/VZNgg2mmj5dPNL74mPrD3TGQNgibSaus4gxIOp+u3gvGecsDkE
IV5JunS8Zy4XbuY8HpN8yRGf/HKoF1MRDXS+DgqGGjcLxM0iQR0kS3n/DDc0JnYR
1M/gsUDVpDM+6Vot0YE3ufbrhdlUfC1pTJ0kIVNJDrHoBBEJQeBIVgqEarCzH9uA
aEwLCm4X9WBaEVowDqwYJiMQ1ntNk/PVRUAeW2faSHRpMnTSy7DFUAQ9w8tZ5wvL
+y5CCZVmmLInlV5Qx/p78LztQWCC1Ef0qZTEa6tRMmrnWL9veSv0dMZgIFN8Y5mM
F/f9KzY3o361bifn5tPGRFV3juwli4VI27zzXWPVGpTDn0PYiTIrx+j94MBzlgzS
yaKc+5K+YZtZy3Lqbu+JLbsG1S2smuMiainc8D5o0s2coeptBsYzTFoNItQb45hp
AtDfNJ7XWpQcJvdEsvRIUXIz3KEi3U2WhOc5wX3ADVPX1mw5Tx8m20SF+Wepfp7U
E/VuwOgHYRf5Hz2hzqzPFaK4hn6PtcTd69wA2ipi89MeBuYHFWCmo7zq4imP5o0Y
1vhLbbIRJ12PlyFMY1+abY43d9xis15rUwzCW46CXz0gmQW5eb+yuSzNcan07PG/
9xgjPyKtrICIogqnryFCdjEYummUlDDKNrbogM13Wpc+UUeOeQKCAQEA2h0GnZHN
M4FASiOrzbyuqKTHmES1YOALm+DjTRZQCJ93kODWdHuc/OcFukQkvSIBWH/WrT2v
lVJo/y4SIjblcyM+UrJvPSp/Zpzut7nkJ/7CCt0/707KP+jZkoXK2YXVT+ZOz2/M
+swJbky1RRnHLBN4nI+kiUpXhuy+kqx4INerpSm4P3C7T5UMO+32RHws/a7+aQzo
D7KLYV/fy/WV6QBTSIaJ3/1jfNisFCvmP1lXcQygrJ+99xs48Ds4kS9U3jGti30+
GcOYFjTusnkUlb041/u31V8vftNHX2tEUlo62gvfkfwPi1c2WMDwHP/x/1zvGogR
NwdSFCOY1NfedQKCAQEA6HkfYUG38qwfTs09GHm6YvkIQRG00+ONxfr275u0E6XR
cZavqzEhw1kAttVw4G/G8CWhrp02MmftSZOU11DDv/5VBLXVcBv2oSt5OAoEY+zC
R9/MIcTwMH21j27qbOyjZ8m6LIYlb17WwSfSrb4S1G25d+E5o2FSR34xFpRk2g11
D+RMT27Jwxc0jvEXrpZ5pFftdt8b7FDrgMaKemp6Tpz+3sK6HTS/4KWMk6h2FIZa
QqDNaz8UFx+G83EiY0GVCxPEo1o60Qs/+Rl5cu0IHphBpEc/CHlMfzrUoRP7wwDq
MOZRRFWlTcY0GVgurkdKYedZyr2AGad2cUnFBBH6EwKCAQBvsbeGj3iu7HyYuuWr
KPmkYSXZQy5DGti3DZY5DrkTgV5AcfNAmWDOXhwfw++wby6TPHwaIWG+LQKZ0uT0
Ynpj2ON8g+XVQ+MUED9rFKXTGXITEDRCf22xBrQMhblYZWHUVdN8BPvKXxxhQKT/
avEFED+OpTyUFd72uFvrTqkB4JAEt3Wj/z3cxi4KrpSTg6eija+46iQYjc00o10+
3FfVhxYfKM6IRwFgmLCeb9CsFjtiKB5L6E3msikZVKpmJv/l/TirGwrnNLO4g4jN
GpZBDDKE4GHGwcTXxKhjI9JL/ervaG8oGhV3vMSW9M7BewxZQiUryAxQys3shEIq
lRVVAoIBAHQ+1N0qIpRbU1BxOoK5o+UHyAPZmcV2fRcptj78aeCFQyT8h50f9VUc
dUn3kvj3i8/b0WxiOo6b/0CSZpQAU9H2mIbBchgcM4hGF9hY0fcxlbihBQ9BziVB
Rv+RI/IRpmgorErFTYTSNKrjgerVJ89Hir2SRuMWsDEFvgAfdgq/PfETZME3kfZW
7TYpAoGPxwXR3fFaATl7ATgkj2xFQCF9SckUMEKYdPYdch0H2PvMbufwRqfBJAeo
ATBMOzjMu32Nhf91CAIuEPA7t8orEqtR0UkXQ0K2fPUF8vsU5giNtY18LdjwxrcM
TFL8EGOfTGeGaxUBC0RIw+ZEUBsH7jcCggEBAKRKxREYuBgXf57MSGplhKc5NAJl
WnH6jsGxY39p5gDCpxym6uSBikGjghKURr5Lt0Pe7ARPuo1wbrKHvPxxPUSmc25j
2L2Fhqv5N2RzPct1J2XRHhiXXoPwhJ6T8zEDrPP+2p6Vtt2fJnwcVXE7xOOa7Ya3
3Lc7dxIiqzYWqOhMmGK+igAJbHxbhU2IqNkaZ2i1frgYxoqbQCQuvjV17DfNIdF2
ex22HerDiPHoHddHA1prvTTCEQh9r8oJb93wY5Eg0anBLCZNimMXqsgMwk5PnZra
Oxg6IkscSA7NevK+y3GDx1AjY9U6VFSFnGKQ9CgH9XWBwZM6EmTCEIULTnY=
-----END RSA PRIVATE KEY-----
]]

conf.internal_cert_chain = [[
-----BEGIN CERTIFICATE-----
MIIFzDCCA7SgAwIBAgIUZmAWs1+s1Dg2mi97r8pFeb0mr/gwDQYJKoZIhvcNAQEN
BQAwUTELMAkGA1UEBhMCTkwxFzAVBgNVBAoTDk9yZ2FuaXphdGlvbi1BMSkwJwYD
VQQDEyBPcmdhbml6YXRpb24tQSBJbnRlcm1lZGlhdGUgQ0EgMTAeFw0yMzEyMjgx
MDU2MDBaFw0yNjEyMjcxMDU2MDBaMDUxMzAxBgNVBAMTKmZyYW5rLWFwaS1nYXRl
d2F5Lm9yZ2FuaXphdGlvbi1hLm5seC5sb2NhbDCCAiIwDQYJKoZIhvcNAQEBBQAD
ggIPADCCAgoCggIBAMYRgHNNZo82ZW4fGN0SlllP0H5ewy7il6PzFK3R6MeLDePt
cPvdGRAnWLd4iI9X5qtgSnv5WLqAAHx/3720OQdgO00PVduc1LkBdcnbghJY5Ssc
9YpW4ldxRzC8Ak1EJ7kiqE4A1kT+S1kxjD8BRvE4krKqWsSEufWMah+1XhoJlv6a
An8bKS3igZPk/c1RFnSfwkdN6IcZJyu/AQfLdlvOwV49WGIs78RI2bnqGkrWhn8Z
P8Bwx1AmfkkIhJ3ChvrCJEy0VX73JznXPd8WeuTENEXF1UVqX4iEmKzUM2gT98gh
m5etvBSH1A6aCBbzLIoHQgwQ8dXIJentMLeBqBrHs9HxNTndPGa7cCz+BTVJu0x2
5pOdehv+vXS4QAYs8Bfe3FPtGjarhmUO1KqlWIKsNkx2Ts3bscDcgJbPSDBN1PPq
9MNi134TqUbPSjo6KPqrooX/iqGBiNUWKcTp04/0v+d4loeWZfvzKeaQkkdxbnqo
qmgnQsJJRyJCmXGvGj3k+tx2raD704wb73Z7j7+cgnIZgjONBMgh6CrtqnKRgtZ9
BTzKvkCWegiYfi5mNSrAQaWz7L8xA2E6Oghp1hNx4out6Pghw1fHod7367X/GEFS
XBKDeLplOlRldKUv7UwqrS0rDaUGfbnr7nqWow57tA4pRwv4Cvrt8ws1CMSvAgMB
AAGjgbcwgbQwDgYDVR0PAQH/BAQDAgWgMB0GA1UdJQQWMBQGCCsGAQUFBwMBBggr
BgEFBQcDAjAMBgNVHRMBAf8EAjAAMB0GA1UdDgQWBBQCvzZlU69UWu7b4xp69fjP
yZ23GTAfBgNVHSMEGDAWgBTCHa8b7IpkueeFUeJ7NLP8rqJ3jzA1BgNVHREELjAs
gipmcmFuay1hcGktZ2F0ZXdheS5vcmdhbml6YXRpb24tYS5ubHgubG9jYWwwDQYJ
KoZIhvcNAQENBQADggIBAIIbdj/ZB9ccOpd/ppK4twqevn9qb6Av4Ci8gRPQS2WR
jAj/xi4bUwf38pwp3rNbFRGxpfTh+sd1NR0q0zK0OoMAn7jmoTTyB+/gZXWpAQRG
mmAnS7nY6f0R5hCbP5d+Y2MsGbqMyFxmCJocYCm9F5mECK0h4LDMcBviAjc1G+46
GlF3samKfaMWjqf/ePjprGCv0Cros1FuCC6uBnif7wh0rltZKSh7AD0S/4y2EjV6
heZGPpoIu1yD0SBDR4gPzs//zoPs+cyO0p2UH1yvwcdpQ91x5nVherDyulaaEhZK
BwgcF6RWh6umGg8IVbReX/i/l78Lqh7V6jrrf+fYv7h/HNgSpd8xyK+6pKWBUAor
i8/sN6ujYOet9l834EPXwfhbYnHMVsmUF7uz2uO+yhUStXdp9ARxjO83bFxWGrZn
WQD1LX01O4y82P25Vtc2xcKtqKww198PR55Dz4ZLmrlEVzwxN2Hm7DCJp/3DUjzx
Peu4GUpJsXGHBZWncXtA1LV8UwbrydEiCY5uTxr2Orb4peT6waXDO9tdgCYox9nC
N5BKCiwZdhuvh1c0tvv83mfTS6oNw110mLBtMwagXVEeNqbThRDY64GfZ8zKXQHm
qw0f9Vn9x50FJZOheIZHrPLdr/Knn0jlEwRCF7dAwCjmFu8bnLVjUsPE0R9r/zTc
-----END CERTIFICATE-----
-----BEGIN CERTIFICATE-----
MIIFjjCCA3agAwIBAgIUAeBaNdp/B4sosib4MzqMavuajG4wDQYJKoZIhvcNAQEN
BQAwSTELMAkGA1UEBhMCTkwxFzAVBgNVBAoTDk9yZ2FuaXphdGlvbi1BMSEwHwYD
VQQDExhPcmdhbml6YXRpb24tQSBSb290IENBIDEwHhcNMjMwMjE0MTI1NDAwWhcN
MzgwMjA5MTI1NDAwWjBRMQswCQYDVQQGEwJOTDEXMBUGA1UEChMOT3JnYW5pemF0
aW9uLUExKTAnBgNVBAMTIE9yZ2FuaXphdGlvbi1BIEludGVybWVkaWF0ZSBDQSAx
MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA0dRYRKmBfbU4LkscPSFO
Szh6XCPxWGMlS6x4bIGjA8PytwtULDLwOKtwabMapYAVx8VMeFx3+r6ZPnVsCZfI
pYHEf/c3ju2sjdA9P9B9TvRNTPMriejkT9/DPVZ/m/IZ44Jgh5TVoRkesBZRkSmw
riBX7FD9vle+RMQd0fiflxFJ//KcaTRQ8XPae8aG4qrGS4IfY6TGeDWzuWXh13AE
nqpP13lyVNVYJQd6iHNmXztx0YcP10+GYLEibgWTfmaxjZi2wgUqYhcPAZ9yfcD4
kFUL+54FWzX3vDys3N49zJPXDUHEQdRwAoTa+RTvtWET2EGK1Jg+wK+ndXozvytu
KTyQvTwtZMkOV+03aEa+4EDebnIEf/bAjTkNqXrJWKg9zW6/vQOZ1YHxHgjnmi7H
nKtjcKecnqvhLoTkNMERN87hpin6iXU54Ti629PtlS1MT79AedtxXB0UK5uL1+lO
K1OKh3giblDX4RfFZk1FAKoAXBtQ/qBUYeDlNtAS0/7+ms/OtUIiv+Fw6xUqU7ZE
quWHBJsR6GyVOHiDt2Orf6z/H/fiih+dv1AeNQT9ZYCd45uHPkJHOUko/kJtnpST
mDsqH51MRbjw+Z35NBq84F7H285/yCOp1gFQyb9GUHue2vm0uQaVhnlsbrVIltu7
ABGxRXHG+kQzKnBcysdvXysCAwEAAaNmMGQwDgYDVR0PAQH/BAQDAgGGMBIGA1Ud
EwEB/wQIMAYBAf8CAQAwHQYDVR0OBBYEFMIdrxvsimS554VR4ns0s/yuonePMB8G
A1UdIwQYMBaAFAAcZqrp7xTODlo2uKhFOAC3sGylMA0GCSqGSIb3DQEBDQUAA4IC
AQCD3nOuWrudf3HCuaK3seRouiaNqNLmSqqEBCGeh+7nfQayJHETR3QfG2luNa4I
zi2w4BogLvV1JeW+k+h4vGNLcxnUEOnxy+Kx6H5pxtPwjXEzNm1CL1qL6+EWsAOx
iR5vQF2MpsdWyps4yPh3mW/BwRaAvubQdG9kuASz4yhJpKN0DCxBgkTou9cP0s8k
9RMO0Orv+QEWTcPXH+Utse/CXMV6zrfOCOh9kGhmdAUgaNJyseWV27F0QxZN+IQV
UIowdOZsW9AFit9HUgyOJQmdb4+IrK8exyoC5iBsVS5rnXnbxiQQtqL1JcJd8R5j
ztha+Cf6/9cHjY0f+Tw+xxyV/j0k8gXvJkVSIyw+dU7T//zt+yOEM9u055a1oo+5
oDQ+AByRgTj+hTzUZM5JgbA1UlTfjF+UVVWueOTOYtsI5smtUryuOWB49wejfmut
aIy7dJOu9K6sdPzq3k7/jKT4klYZZOdk756CX/5djxETC6xruR/XSh6MAxVdXEIP
Sjt2Z/U+371sk562fmOqiFcdHWuDXAAV4PQf8nFLrOsUK6lNSfBQhbYA3OQke2NS
JpOnclTEixWK3VBpKJ1uE7mHnwY+9I0Uo5dCxZBsIAFoh2ik3iSD9H1qQDAYRDVB
Dj5k7oJx+Nm5+ZofUPdsh+XHwXKINV3QaP13SopfPYUhLA==
-----END CERTIFICATE-----
]]

local cert_chain = assert(ssl.parse_pem_cert(conf.internal_cert_chain))
if conf.internal_key == nil then
	ngx.log(ngx.ERROR, "cannot find private key from config")
end

local pkey, err = ssl.parse_pem_priv_key(conf.internal_key)
if err ~= nil then
	ngx.log(ngx.ERR, "cannot parse private key")
end

local ok, err, ssl_session = httpc:connect({
	scheme = "https",
	host = "controller-api.organization-a.nlx.local",
	port = 7600,
	ssl_verify = false,
	ssl_server_name = 'controller-api.organization-a.nlx.local',
	ssl_client_cert = cert_chain,
	ssl_client_key = pkey,
})
if not ok then
	ngx.log(ngx.ERR, "connection failed: " .. err)
	return
end

local params = {
	method = "PUT",
	path = "/groups/fsc-local/inways/frank-api-gateway",
	body = '{"address": "https://frank-api-gateway:9443"}',
	--ssl_verify = true,
	--ssl_client_cert = cert_chain,
	--ssl_client_key = pkey,
	version = 1.1,
	headers = {
		["Content-Type"] = "application/json",
		["Host"] = "controller-api.organization-a.nlx.local",
	},
}


local res, err = httpc:request(params)
--local res, err = httpc:request_uri("https://172.17.0.1:7600/groups/fsc-local/inways/frank-api-gateway", params)
if err ~= nil then
	ngx.log(ngx.ERR, "cannot perform request " .. err)
end
--
-- block by default when decision is unavailable
if not res then
	ngx.log(ngx.ERR, "failed to register Inway: " .. err)
end