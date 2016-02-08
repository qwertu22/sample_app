# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
#SampleApp::Application.config.secret_key_base = '9213c1731596d59cece9a0f9d2133197327f9532705ce23dbe3842ef15837ba1e3e7cd2f733ecf985ff888919850987cfbb4843d6a047bfd6cae7f12babacbfc'
require 'securerandom'

def secure_token
  token_file =Rails.root.join('.secret')
  if File.exist?(token_file)
    File.read(token_file).chomp
  else 
    token= SecureRandom.hex(64)
    File.write(token_file,token)
    token
  end
end

SampleApp::Application.config.secret_key_base = secure_token
