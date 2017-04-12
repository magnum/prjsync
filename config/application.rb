require_relative 'boot'

#require 'rails/all'
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_cable/engine"
#require "active_resource/railtie" # Comment this line for Rails 4.0+
require "rails/test_unit/railtie"
# require "sprockets/railtie" # Uncomment this line for Rails 3.1+

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Prjsync
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.autoload_paths << Rails.root.join('lib')
    config.eager_load_paths += %W( #{config.root}/lib )

    config.generators do |g|
      g.orm :mongoid
    end
  end
end
