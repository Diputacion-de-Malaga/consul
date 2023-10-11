module Consul
  class Application < Rails::Application
    config.i18n.default_locale = :es
    available_locales = [
      "es",
      "en"
    ]
    config.i18n.available_locales = available_locales
    config.i18n.fallbacks = {
      "en"    => "es"
    }

    config.i18n.load_path += Dir[Rails.root.join("config", "locales", "**[^custom]*", "*.{rb,yml}")]
    config.i18n.load_path += Dir[Rails.root.join("config", "locales", "custom", "**", "*.{rb,yml}")]

    config.after_initialize do
      Globalize.set_fallbacks_to_all_available_locales
    end
  end
end
