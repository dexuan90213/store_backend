require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module StoreBackend
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    config.generators do |g|
      g.helper false
      g.assets false
    end

    config.i18n.default_locale = 'zh-TW'
    config.time_zone = 'Taipei'

    config.active_storage.replace_on_assign_to_many = false
  end
end
