require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ErpWeb
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    config.exceptions_app = routes
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.time_zone = 'Brasilia'
    # Load Path
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
    # Locales
    config.i18n.enforce_available_locales = false
    config.i18n.available_locales         = [:'pt-BR']
    config.i18n.default_locale            = :'pt-BR'
    config.i18n.fallbacks = [I18n.default_locale]
    # Don't generate suystem test files ( MineTest ).
    config.generators.system_tests = nil
    # Generate test to RSPEC
    config.generators do |g|
      g.test_framework :rspec, fixtures: false,
                               view_specs: false,
                               helper_specs: false,
                               routing_specs: false
    end

    config.middleware.use Rack::Attack
    # Determines whether form_with generates remote forms or not. This defaults to true
    config.action_view.form_with_generates_remote_forms = false

    config.autoloader = :classic
  end
end

if Rails.env.development?
  Sprockets.export_concurrent = false
end
