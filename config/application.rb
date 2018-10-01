require_relative 'boot'

require 'rails/all'
require 'elasticsearch/rails/instrumentation'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AutofillProject
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.to_prepare do
      Devise::RegistrationsController.layout proc{ |controller| user_signed_in? ? "dashboard" : "application" }
    end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
