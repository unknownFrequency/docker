require_relative 'boot'
require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Myapp
  class Application < Rails::Application
    Rails.application.config.assets.precompile += %w( components.js )
    config.autoload_paths += %W["#{config.root}/app/validators/"]
  end
end
