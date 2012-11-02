module Refinery
  module Sponsors
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Sponsors

      engine_name :refinery_sponsors

      initializer "register refinerycms_sponsors plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "sponsors"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.sponsors_admin_sponsors_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/sponsors/sponsor',
            :title => 'img'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Sponsors)
      end
    end
  end
end
