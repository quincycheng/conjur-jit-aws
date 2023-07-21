require 'sinatra'
require 'aws-sdk-sts'
require 'conjur-api'
require 'json'
require 'openssl'
require "logger"

set :bind, '0.0.0.0'

post '/conjur-jit-aws' do

  # Fetch the necessary information from environment variables
  conjur_url = ENV['CONJUR_URL']
  conjur_account = ENV['CONJUR_ACCOUNT']
  conjur_api_key = ENV['CONJUR_API_KEY']
  conjur_login = ENV['CONJUR_LOGIN']
  
  # Fetch the necessary information from CyberArk Conjur
  Conjur.configuration.appliance_url = conjur_url
  Conjur.configuration.account = conjur_account

  conjur = Conjur::API.new_from_key conjur_login, conjur_api_key

  aws_secret_key_id = conjur.resource("#{Conjur.configuration.account}:variable:data/jit-aws/aws_access_key_id").value
  aws_access_key = conjur.resource("#{Conjur.configuration.account}:variable:data/jit-aws/aws_secret_key").value
  aws_role_region = conjur.resource("#{Conjur.configuration.account}:variable:data/jit-aws/aws_region").value

  p aws_secret_key_id
  p aws_access_key
  p aws_role_region

  # Fetch the role ARN and session name from the POST body content in JSON format
  content = request.body.read
  p content
  content2 = content.gsub('\"', '"')
  p content2

  request_body = JSON.parse(content2)
  role_arn = request_body["role_arn"]
  session_name = request_body["session_name"]
  duration_seconds = request_body["duration_seconds"]
  policy = request_body["policy"]

  # Set up the AWS STS client
  sts_client = Aws::STS::Client.new(
    region: aws_role_region,
    access_key_id: aws_secret_key_id,
    secret_access_key: aws_access_key
  )
  
  # Assume the role
  resp = sts_client.assume_role({
    role_arn: role_arn,
    role_session_name: session_name,
    policy: policy,
    duration_seconds: duration_seconds
  })
  
  # Return the temporary credentials as JSON
  content_type :json
  {
    access_key_id: resp.credentials.access_key_id,
    secret_access_key: resp.credentials.secret_access_key,
    session_token: resp.credentials.session_token,
    expiration: resp.credentials.expiration
  }.to_json
end