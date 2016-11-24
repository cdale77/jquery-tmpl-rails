require "active_support/ordered_options"

module JqueryTmplRails
  class Railtie < Rails::Engine
    config.jquery_templates = ActiveSupport::OrderedOptions.new
    config.jquery_templates.prefix = ""

    initializer "sprockets.jquery_templates", :after => "sprockets.environment", :group => :all do |app|
      next unless app.assets
      #app.assets.register_engine(".tmpl", JqueryTemplate)
      app.assets.configure do |env|
        env.register_mime_type "text/tmpl", extensions: %w(.tmpl)
        env.register_transformer "text/tmpl", "text/html", JqueryTemplate
      end
    end
  end
end
