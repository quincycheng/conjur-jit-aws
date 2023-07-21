#!/bin/bash

curl -ks https://<conjur cloud or edge API endpoint >/conjur-jit-aws \
-H "(conjur authn authenticate -H)" \
-H 'Content-Type: application/json' \
-d '{"role_arn":"<role arn>","session_name":"<demo session>"},"duration_seconds":"<duration in seconds>", "policy":"<policy in json>" \
 | jq .