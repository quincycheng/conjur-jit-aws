#!/bin/bash

curl -ks https://localhost:8443/conjur-jit-aws \
-H "(conjur authn authenticate -H)" \
-H 'Content-Type: application/json' \
-d '{"role_arn":"<role arn>","session_name":"<demo session>"}' \
 | jq .