require 'omniauth'
require 'omniauth-github'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, Rails.application.credentials.github[:client_id], Rails.application.credentials.github[:client_secret], callback_url: 'https://encountersim-fe-ea3ea78fa419.herokuapp.com/auth/github/callback'
end