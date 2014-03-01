require File.expand_path('../boot', __FILE__)

require 'rails/all'
require "sprockets/railtie"

Bundler.require(:default, Rails.env)

module Randompocket
  class Application < Rails::Application
    config.encoding = "utf-8"
    config.filter_parameters += [:password]
    config.active_support.escape_html_entities_in_json = true
    config.assets.enabled = true
    config.assets.version = '1.0'
    config.assets.initialize_on_precompile = false
    config.i18n.default_locale = :ja
    I18n.enforce_available_locales = false
  end
end
