# Just in time Secrets for AWS by Conjur

## Overview
This is a functional POC demo to showcase the potential of Conjur in extending its capabilities to provide just-in-time secrets. 
Please note that the architecture, functionality, and user experience that will be demonstrated in this demo may not reflect the final product of Conjur in the future.

## Demo Video
[![Demo video on Just in time Secrets for AWS by Conjur](https://img.youtube.com/vi/A-82SpyN184/maxresdefault.jpg)](https://www.youtube.com/watch?v=A-82SpyN184)

## Demo Steps
1. Build the env as Conjur admin by executing `bin/00_build_env.sh`
2. Please refer to AWS doc to create AWS User & Role for AWS STS.  
3. Update `bin\01_add_aws_cred_template.sh` with info from step 2 and execute it
4. Switch to user by executing `bin\02_switch_to_user.sh`
5. Verify that user has not access to AWS cred from step 2 by executing `conjur list`
6. Update `bin\03_get_jit_secrets_template.sh` with role ARN from step 2 & session name
7. Execute the script in step 6 and get a just in time secret!

## Clean up 
Execute `bin/99_cleanup.sh`

# Dev Note
To generate `Gemfile.lock`, execute the following in 
`docker run --rm -v "$PWD":/usr/src/app -w /usr/src/app ruby:2.7 bundle install`
