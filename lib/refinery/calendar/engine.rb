module Refinery
  module Calendar
    class Engine < Rails::Engine
      include Refinery::Engine

      isolate_namespace Refinery::Calendar

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.pathname   = root
          plugin.name       = 'refinery_calendar'
          plugin.url        = proc { Refinery::Core::Engine.routes.url_helpers.calendar_admin_events_path }
          plugin.menu_match = %r{refinery/calendar(/.*)?$}
        end

        Rails.application.config.assets.precompile += %w(
          refinerycms-calendar.js
          refinerycms-calendar.css
        )
      end

      def self.register_calendar(tab)
        tab.name = 'Details'
        tab.partial = '/refinery/calendar/admin/events/tabs/event_details'
      end


      config.after_initialize do

        Refinery.register_extension(Refinery::Calendar)
        Refinery::Calendar::Tab.register do |tab|
          register_calendar tab
        end

      end
    end
  end
end
