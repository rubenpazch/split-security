# frozen_string_literal: true

DeviseTokenAuth.setup do |config|
  config.change_headers_on_each_request = Rails.env.production?
  config.token_cost = Rails.env.test? ? 4 : 10
  config.check_current_password_before_update = :password
  config.send_confirmation_email = true
  # By default this value is expected to be sent by the client so that the API
  # knows where to redirect users after successful email confirmation. If this
  # param is set, the API will redirect to this value when no value is provided by the client.
  config.default_confirm_success_url = Rails.env.production? ? 'https://split-security-eedd2fe0a035.herokuapp.com/login' : 'http://localhost:4200/login'

  # By default this value is expected to be sent by the client so that the API
  # knows where to redirect users after successful password resets. If this
  # param is set, the API will redirect to this value when no value is provided by the client.
  config.default_password_reset_url = Rails.env.production? ?  'https://split-security-eedd2fe0a035.herokuapp.com/reset-password' : 'http://localhost:4200/reset-password'
  # By default, old tokens are not invalidated when password is changed. Enable
  # this option if you want to make passwords updates to logout other devices.
  config.remove_tokens_after_password_reset = true
end
