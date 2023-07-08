#!/bin/bash

conjur logout

conjur login -i user_a -p $(cat .user_password)

printf "Logged in as: "
conjur whoami | jq .username