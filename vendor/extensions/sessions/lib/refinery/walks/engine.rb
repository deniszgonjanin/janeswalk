module Refinery
  module Walks
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Walks

      engine_name :refinery_sessions

      initializer "register refinerycms_walks plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "walks"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.walks_admin_walks_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/walks/walk',
            :title => 'guide_name'
          }
          #don't show walks in the admin. Walks are shown as subitems of Sessions in the Session admin
          plugin.hide_from_menu = true
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Walks)
      end
    end
  end
end
