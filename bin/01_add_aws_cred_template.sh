#!/bin/bash
conjur whoami | jq .
conjur variable set -i data/jit-aws/aws_access_key_id -v [AWS Access Key ID]
conjur variable set -i data/jit-aws/aws_secret_key -v [AWS Access Key ID]
conjur variable set -i data/jit-aws/aws_region -v "us-east-1"
