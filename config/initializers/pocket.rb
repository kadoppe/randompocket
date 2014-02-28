Devise.setup do |config|
  config.omniauth :pocket, ENV['POCKET_SECRET_KEY']
end

require 'pocket.rb'
Pocket.configure do |config|
  config.consumer_key = ENV['POCKET_SECRET_KEY']
end
