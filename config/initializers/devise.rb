Devise.setup do |config|
  config.secret_key = ENV['DEVISE_SECRET_KEY'] || '3a711dca410f6f86bdce1981edfce86bb89139a35ac5e8a1277b8068cefbc96eea99518f9bb3398bb35d71c3b95c3797774874777ba458d85b5bacbe1cba503d'
  config.mailer_sender = "please-change-me-at-config-initializers-devise@example.com"
  require 'devise/orm/active_record'
  config.case_insensitive_keys = [ :email ]
  config.strip_whitespace_keys = [ :email ]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 10
  config.reconfirmable = true
  config.password_length = 8..128
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete
end
