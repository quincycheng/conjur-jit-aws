#!/bin/bash
APP_ROOT=$(dirname $(dirname "$(realpath "$0")"))

# Prepare the files

cd $APP_ROOT

cat <<'EOF' > .env
CONJUR_ADMIN=b81t11ebd2en115rjc3bbyfhhhtvcttyc0bm42jcagzreb8pd7
CONJUR_DATA_KEY=B/gTTlJH1mGU3rcYwp+ShzhuGK5kV6JEatXLw51MHc8=
CONJUR_LOGIN=admin
EOF

mkdir -p conf
mkdir -p conf/tls

cat <<'EOF' > conf/tls/nginx.crt
-----BEGIN CERTIFICATE-----
MIIDcjCCAlqgAwIBAgIJAJ5mUhk7uqDiMA0GCSqGSIb3DQEBCwUAMGUxCzAJBgNV
BAYTAlVTMRIwEAYDVQQIDAlXaXNjb25zaW4xEDAOBgNVBAcMB01hZGlzb24xETAP
BgNVBAoMCEN5YmVyQXJrMQ0wCwYDVQQLDARPbnl4MQ4wDAYDVQQDDAVwcm94eTAe
Fw0yMjA3MTkwMjM3NDJaFw0zMjA3MTYwMjM3NDJaMGUxCzAJBgNVBAYTAlVTMRIw
EAYDVQQIDAlXaXNjb25zaW4xEDAOBgNVBAcMB01hZGlzb24xETAPBgNVBAoMCEN5
YmVyQXJrMQ0wCwYDVQQLDARPbnl4MQ4wDAYDVQQDDAVwcm94eTCCASIwDQYJKoZI
hvcNAQEBBQADggEPADCCAQoCggEBAPRWNO9TXWGOKCmCottrxgxrq1bFwDrwdekK
TAT41ZL5OsZS97uFkRQoC6i1NFl6Y7jKD3nUHfd5+i4C8Q8pmi/9KOZGDzOeOHEf
KRWGxe0wfL+wEcKaSNSLSjqlETvo42x5JXlIxNtwk6ZmwpfkpW9d93D7XjmI7baH
WyXqbPmdub7A9guwWHb0ahotQMdGsPzJk28+P566/NTPEgiTtZUk8TZE1R6FCGT5
8B9xFUJtnQuMz+dPYhPVvQATt/NVst1MUIb7i8a4/oUFcgeoBevGweFDhXKal5v/
CokyvJpzpihj4eZhUJag31Gteruams0RVkkEDNqb7DmA/P9r/B8CAwEAAaMlMCMw
IQYDVR0RBBowGIIJbG9jYWxob3N0ggVwcm94eYcEfwAAATANBgkqhkiG9w0BAQsF
AAOCAQEANlueCzqj4iscv4d7tfXk9HAEYGwKcEMqxUGgbHCHXDqBO8VRRXl2u9n1
Cc7wkPWlAf2S/C+EnRn29GdnPArRgjRthRefuEW6Jrrkym2wYbunfw819TE+COjD
yuMq76WYIRXN+5ohJ8iXgbyqVgvfsJMfhKQSzsaN4L80qptxw5OwuNUBDtKkXABa
2CRR6bxll9Yk3KXL+goLlkShjTDUpaIEzkmA4E40nPf0YJ4vmsusQ3NpP66Bdmey
1a51CZ1B7Vnjo88FR1B8E/9QYXClc7Wv7m+1ApStDIqNF77BGVeM/HqhyLJBWKbW
uif5gFBtTXe9eUCfiymm+tPlrBkmuw==
-----END CERTIFICATE-----
EOF

cat <<'EOF' > conf/tls/nginx.key
-----BEGIN PRIVATE KEY-----
MIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQD0VjTvU11hjigp
gqLba8YMa6tWxcA68HXpCkwE+NWS+TrGUve7hZEUKAuotTRZemO4yg951B33efou
AvEPKZov/SjmRg8znjhxHykVhsXtMHy/sBHCmkjUi0o6pRE76ONseSV5SMTbcJOm
ZsKX5KVvXfdw+145iO22h1sl6mz5nbm+wPYLsFh29GoaLUDHRrD8yZNvPj+euvzU
zxIIk7WVJPE2RNUehQhk+fAfcRVCbZ0LjM/nT2IT1b0AE7fzVbLdTFCG+4vGuP6F
BXIHqAXrxsHhQ4Vympeb/wqJMryac6YoY+HmYVCWoN9RrXq7mprNEVZJBAzam+w5
gPz/a/wfAgMBAAECggEAFxAUCwsJY23xqIlmKePwW7fGAnjD/kw4NPj91/JM5oST
4ahvLcobuZVWFGSWPmPpCcY4070L3xIqZTFt44p/vUveEm5GfQ7QMQ1J6XhBMnRD
MizCYGYDvdwv830lNUx0OwbsXJhbzILBzREiCQhR/UMXWhi/+hpMpc/88IVCKAVm
CxwPOYcpmLns5UPjnqcMJdR5+9WjNY5eiBSdt69kOdxxrb7/8rDoE88P7xnH4aOO
qdXt/02wJHyhi2cWfrsLvWXfwbIlowW+9oTXU7iFQDlSbkyM9pNiJuugjRV7s5jS
PStMlkRPJ9Vma24224P77S5IBvsjqCcHC53FkEHewQKBgQD0nwBjCTRC1Ac4GmDc
4KaMGXy3FDpKTsMM2lGFzpR0voiFQl2MUjPN6F3rHI8uoTxaYih9AMDUpNwbHvYe
wjtV1PV2v4fcMz1LtqGG8VeTTdGviIZlJinoHD6e5jf+MmzMUi0j+SZMU0dk/hXn
4Amef4HPShHm1LyqTmbldjJkkQKBgQD/s9GxfDhAWV2xKeUEsh+SryF/j2xI8OLT
/AP4eVnjLSh7wOP8f84ClsyykWuArx7fnTNVFZTy0QXMQUPsi9XP+nNGY06iM78n
lIs9QIgxXYpbcjDIb4Tu+BrTEQ8SdBbU9DHeY7dwrsJARakw9HHOJzsN7//cjf8S
zAfAYW/trwKBgQDBlP6CYStJY29fF4jl4qYKIrVOUKScX1390ttGz6cuCAYTpuRP
AlJatXN1dsFcfl47jIhL/Aedf+VrVQIib0TzdLbXxVRnjukH/LwxBNZwDNpOVfU9
IIlzVL69kqRm9lKhErsER8vmBNVv958wQ1x5YKBCgXRPPrUa9TZ6iiHw8QKBgQCO
1ONNQRYq28B6Ney3ssfwJ+OOXY8fL2+E+kE9iourWo5CknzHjpyE1beCB7kFKM0W
G7mQzX1mJVwXvF00xOeqRTwfFVnXQRCGC3O7w1BQQvAGJMMbMzAOTIivXdgNdstK
KR2yHAFb8EKRpFfeAK2ReliCcI17pdXVqiKqU8MyAQKBgQCST6B99UwMrImgWk4a
1p/SEsj2Ak0mKaPZ84D9gECoBcSjPc+4cSL4+U5uRvaE4OS2oyskkUB4tGTSw4zq
L3uxLXlSM4DLM6N/lMDLWToHGDzLiidi551ntz8kwroGfprYVoeuljdfuCf2Xr2Q
qBZ6hbQYgA+AeoYXYx2klPniIg==
-----END PRIVATE KEY-----
EOF

# p12
# openssl pkcs12 -inkey conjur.key -in conjur.pem -export -out conjur.p12

cat <<'EOF' > conf/default.conf
server {
    listen              443 ssl;
    server_name         proxy;
    access_log          /var/log/nginx/access.log;

    ssl_certificate     /etc/nginx/tls/nginx.crt;
    ssl_certificate_key /etc/nginx/tls/nginx.key;

    location / {
      proxy_pass http://conjur;
    }

    location /conjur-jit-aws {
      proxy_pass http://conjur-jit-aws:4567;
    }
}
EOF

cat <<'EOF' > conf/tls/tls.conf
[req]
default_bits = 2048
prompt = no
default_md = sha256
req_extensions = req_ext
distinguished_name = dn
x509_extensions = v3_ca # The extentions to add to the self signed cert
req_extensions  = v3_req
x509_extensions = usr_cert

[ dn ]
C=US
ST=Wisconsin
L=Madison
O=CyberArk
OU=Onyx
CN=proxy

[ usr_cert ]
basicConstraints=CA:FALSE
nsCertType                      = client, server, email
keyUsage = nonRepudiation, digitalSignature, keyEncipherment
extendedKeyUsage = serverAuth, clientAuth, codeSigning, emailProtection
nsComment                       = "OpenSSL Generated Certificate"
subjectKeyIdentifier=hash
authorityKeyIdentifier=keyid,issuer

[ v3_req ]
extendedKeyUsage = serverAuth, clientAuth, codeSigning, emailProtection
basicConstraints = CA:FALSE
keyUsage = nonRepudiation, digitalSignature, keyEncipherment

[ v3_ca ]
subjectAltName = @alt_names

[ alt_names ]
DNS.1 = localhost
DNS.2 = proxy
IP.1 = 127.0.0.1
EOF


mkdir $APP_ROOT/policy

cat <<EOF > $APP_ROOT/policy/root.yml
- !policy
  id: conjur

- !policy
  id: data
EOF

cat <<EOF > $APP_ROOT/policy/root.yml
- !user
  id: user_a

- !policy
  id: conjur

- !policy
  id: data
EOF

cat <<EOF > $APP_ROOT/policy/data.yml
- !policy
  id: jit-aws
EOF


cat <<EOF > $APP_ROOT/policy/jit-aws.yml
# Declare the secrets which are used to access the database
- &variables
  - !variable aws_access_key_id
  - !variable aws_secret_key
  - !variable aws_region

# Define a group which will be able to fetch the secrets
- !group secrets-users

- !permit
  resource: *variables
  privileges: [ read, execute ]
  roles: !group secrets-users

EOF


# Start the services
docker-compose pull
docker-compose build

docker-compose up --build -d 

# Wait for services to be ready
sec=12
while [ $sec -ge 0 ]; do
        echo -ne "Waiting for services to start in $sec seconds\033[0K\r"
        let "sec=sec-1"
        sleep 1
done

# Login to Conjur
source .env
CONJUR_URL=https://localhost:8443

echo -e "y y" | conjur init  -s -u $CONJUR_URL -a default --force
conjur login -i admin -p $CONJUR_ADMIN

# Load Conjur Policies
conjur policy replace -f policy/root.yml -b root
conjur policy load -f policy/data.yml -b data
conjur policy load -f policy/jit-aws.yml -b data/jit-aws

# Save user_a password
user_password=$(conjur user rotate-api-key -i user_a | sed -n '2 p' )
echo "${user_password##* }" > .user_password

echo ""
echo ""

printf "Logged in as: "
conjur whoami | jq .username
echo "Ready!"