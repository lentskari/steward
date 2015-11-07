require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Steward
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    ENV["UBER_SERVER_TOKEN"] = "HAZtwZ8cHLlqllERn0_juiXvMh8Fz9KrDf-Hji3y"
    ENV["UBER_CLIENT_ID"] = "-zlI-ceplKA1hn2oo4dbVAA1nkRcxVFH"
    ENV["UBER_CLIENT_SECRET"] = "m4jWrdRTI5o9hgt91rCa-JylEsQuQ0J56aXFCRy8"
    ENV["FINAVIA_SERVICE_TICKET"] = "ST-JAkQyT0pcqQXqeQ"
    ENV["FINAVIA_APPID"] = "airplane"
    ENV["FINAVIA_ACCESS_TOKEN"] = "TGT-iYuy1zFb0P5DISM"
    ENV["FINAVIA_USERNAME"] = "slush"
    ENV["FINAVIA_SECRET"] = "f1na350!"
  end
end
