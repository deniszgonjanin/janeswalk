module Refinery
  module Sessions
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Sessions

      engine_name :refinery_sessions

      initializer "register refinerycms_sessions plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "sessions"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.sessions_admin_sessions_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/sessions/session',
            :title => 'status'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Sessions)
      end
    end
  end
end
