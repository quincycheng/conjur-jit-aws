#!/bin/bash
APP_ROOT=$(dirname $(dirname "$(realpath "$0")"))
docker-compose -f $APP_ROOT/docker-compose.yml down

rm -f $APP_ROOT/.env
rm -rf $APP_ROOT/conf
rm -rf $APP_ROOT/policy
rm -f .user_password