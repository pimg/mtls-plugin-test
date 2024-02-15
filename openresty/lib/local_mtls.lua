local ssl = require('ngx.ssl')

local cert_chain = [[
-----BEGIN CERTIFICATE-----
MIIDIzCCAgsCFEKbXpVhRJ09pF6bDF60Pg5DOsoAMA0GCSqGSIb3DQEBCwUAMFcx
CzAJBgNVBAYTAk5MMRMwEQYDVQQIDApTb21lLVN0YXRlMSEwHwYDVQQKDBhJbnRl
cm5ldCBXaWRnaXRzIFB0eSBMdGQxEDAOBgNVBAMMB3Jvb3QuY2EwHhcNMjQwMjE1
MTI0NDI0WhcNMjYwNTIwMTI0NDI0WjBFMQswCQYDVQQGEwJBVTETMBEGA1UECAwK
U29tZS1TdGF0ZTEhMB8GA1UECgwYSW50ZXJuZXQgV2lkZ2l0cyBQdHkgTHRkMIIB
IjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAxoDbczxamOSKDEwV86t0/6Fy
5FP7fqYcjG1RJKhP0TsQOVxk6AEQZFclrcTF8OBo+dXvNsVQDDFkzHVrBCd88XMG
OFYVEhkWlJnZa8gfPLBfV7gw3ZCg4XP4TnkfzReRneBYHW/eTPKdWkzVePDrtxYH
F5av/Wh4+QnUCHwz272GewJ3PtTNDnzOUb8zdCpQ5WxV9o23Dfs4uHyZK/fZWTeW
PXnsUerPNx0WPMU0s0DMlLEotwfoa81Np0revRSBhQpg1ukklplMcWaIsnFoKa9C
QMqGRy+EHGqn/9zBaAcMd3SulB+n7/G6QtDCjFTcy9piNp1jwFcF6uerUluFxwID
AQABMA0GCSqGSIb3DQEBCwUAA4IBAQBI+EwHlbbM4MTetY8uB8N/GxIJ1Xp6lYLr
fJnA9faKz7z7N9Rz/ExVlcL8hadx+ahHKQjBteYuySMHPgOrHCzHNdLU/I92nXQ5
OuqcmPPFO9bhL2YdFMr3MnHZ+9mfBgPf9iyoDydIO3M9okf4CwLOyNErniix6NsH
xXFllsxOLOptw3o657Xcrity/yMXLXl77eMSsykxfVuDK6B1JBk+Ijd0iWS2MzB3
d1XzINGvnuIcYCixq4t945FiRRuWtBG2KCHAYHk2PzW5kooj5w1LL222qF2b4JBW
pTfdhrepgG9IQ9p0OtUXoSeabPs6om1YuOtHGeCLlzLmU3DG0s+T
-----END CERTIFICATE-----
]]

local private_key = [[
-----BEGIN PRIVATE KEY-----
MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDGgNtzPFqY5IoM
TBXzq3T/oXLkU/t+phyMbVEkqE/ROxA5XGToARBkVyWtxMXw4Gj51e82xVAMMWTM
dWsEJ3zxcwY4VhUSGRaUmdlryB88sF9XuDDdkKDhc/hOeR/NF5Gd4Fgdb95M8p1a
TNV48Ou3FgcXlq/9aHj5CdQIfDPbvYZ7Anc+1M0OfM5RvzN0KlDlbFX2jbcN+zi4
fJkr99lZN5Y9eexR6s83HRY8xTSzQMyUsSi3B+hrzU2nSt69FIGFCmDW6SSWmUxx
ZoiycWgpr0JAyoZHL4Qcaqf/3MFoBwx3dK6UH6fv8bpC0MKMVNzL2mI2nWPAVwXq
56tSW4XHAgMBAAECggEAEHx1PW3ezGH2wSy0igdMcUq0YxhCg/NB3bvaiGPeNS9l
mo3853PnK549R+BW3DmXHmDRPEhI7KpRh9WcrLym2NrHwngLyfQBdxgMAbKePYkc
cgmfLVestOzPy5ytsnfppSYTy2YWHWfs/6nv9Np1iUAwGJpwRWie23ggfw/psq82
ZJfg7u5tpi9yvyoyCZegDVdY9KIQBBVBOSq8VORampzTUToffISiicKVhlU7i9zw
/kCe71HexU8by3px1D8TnZS9v3Z04ohDbEoF8ZmFdSq5+DMzCVg3ilZuZb/Rt23d
v29ruusKWNAfnzeb0AqotunUhLbO2sT95hBuQjt+gQKBgQDQrGqvI2fFsjq0vCOG
baPyMXpLbWzqQucL8d6JKqE3ChwyJP0grmn0lAFksbCkHUpuJPmlWY4W/s+//vjX
QKxPMlVlY1xWZhTCuzOBKr8/8ytEv0NP5qtsowczv4fWtq9PAAkgkM7nGZzLFoQn
E9Zc66mIt1Fw3gHqd1ZwR+mhBwKBgQDzhfYa2M9w96Z4p/QiniCzmU5aTemxpgEQ
rWjkVEWtyV9PTf19rM9ldastborzxg3YViYsN0tYZtW2LBhmRZI0FFMXYRp/yUYI
iI5zTNX+UkGe1Qz2exPga2vKmF344o8K3lH2CKQVRKYXswmhjetAQqbtyjRn0+aM
a/rB2leFQQKBgFJ17+qpyRY8qipFtpwms4S/vJ4V7dZc/cSgndoCeJaxbhb6uvSx
N7moyywpc65GzOTdw7FtxFKd+ybZ8SfOrMjXERvxucmCqW2SYHYImG8C/vQ5yLXI
Z7GUcwImC93zby9+yhyOXNTCME2o5iwzEKDDl8ko+AvsD0HCSuwv3sj9AoGBAIeC
H7RIuQXviJ7TNrKcsy29PTBa8pN8AFO7awbDLhLKX1LN3ySzqKSYmawqOv/zUXj0
V0F7c125u2onl1wxkm2QcbwsuIYrBeFxu3LFar6eHw23GAN/8UuL+us9Ze08hMRT
eeAiZsu+6318jvtq8WFMtX7UadzsuPmijGKakOEBAoGATYJ0cjGjVkV7AuS0yaKf
XGuDFwzvyJAmju1A/6krolhuMWWqoFb+IdW4MJ+5x5PT8CVbJ9DsJL3neE7iyNl1
hjXWffntlGZwmIsO7rHI1Xf+ji/TD4NcEnATQvimJw4//Gf90+gM9UQqgi2xTwWy
GKK7xj7xwDr2XoxhL1lhbVM=
-----END PRIVATE KEY-----
]]

local cert = assert(ssl.parse_pem_cert(cert_chain))
local key = assert(ssl.parse_pem_priv_key(private_key))

local httpc = assert(require('resty.http').new())

local ok, err = httpc:connect {
	scheme = 'https',
	host = 'unix:./mtls.sock',
	ssl_verify = false,
	ssl_client_cert = cert,
	ssl_client_priv_key = key,
}

if ok and not err then
	local res, err = assert(httpc:request {
		method = 'GET',
		path = "/",
		headers = {
			['Host'] = 'test.server',
		},
	})

	ngx.say(res:read_body())
end

httpc:close()