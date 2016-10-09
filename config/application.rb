require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TreasureSearch
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.action_view.field_error_proc = Proc.new do |html_tag, instance|
      if instance.kind_of?(ActionView::Helpers::Tags::Label)
        html_tag.html_safe
      else
        method_name = instance.instance_variable_get(:@method_name)
        errors = instance.object.errors[method_name]
        "<div class=\"has-error\">#{html_tag}<span class=\"help-block\">#{errors.first}</span></div>".html_safe
      end
    end
  end

end
