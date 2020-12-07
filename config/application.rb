require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module Rubocoppers
  class Application < Rails::Application
    config.load_defaults 6.0
    config.exceptions_app = routes
  end
end
