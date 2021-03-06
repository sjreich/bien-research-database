require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module BienResearchDatabase
  class Application < Rails::Application
    config.generators do |g|
      g.test_framework :rspec
      g.integration_tool :rspec
    end
  end
end
