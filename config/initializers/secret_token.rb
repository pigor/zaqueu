# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
if Rails.env.development? || Rails.env.test?
  secret_key_base = '75898d8956d81cba812ae485aaca74fc3f09019649579ebe7178cebc8795ff5587e58724e76c5b1b3dddd8ddd547f11bc2e4292cbb002530e84606e0a37ffefa'
  Zaqueu::Application.config.secret_key_base = secret_key_base
else
  Zaqueu::Application.config.secret_key_base = ENV['SECRET_KEY_BASE']
end
