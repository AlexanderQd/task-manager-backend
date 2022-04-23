require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TaskManager
  class Application < Rails::Application
    require File.expand_path('../../lib/appconfig', __FILE__)

    config.load_defaults 7.0

    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '*.{rb,yml}').to_s]
    config.api_only = true

    config.eager_load_paths << Rails.root.join('lib')
    config.autoload_paths << Rails.root.join('lib')

    config.active_record.timestamped_migrations = false

    config.action_controller.permit_all_parameters = true
  end
end

