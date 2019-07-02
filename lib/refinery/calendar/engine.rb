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

      config.after_initialize do
        tabs = [
          {title: 'Poster',        partial: 'poster_image'},
          {title: 'Date and Time', partial: 'date_time'},
          {title: 'Ticketing',     partial: 'tickets'},
          {title: 'Venue',         partial: 'venue'},
          {title: 'Images',        partial: '/refinery/admin/pages/tabs/images'}
        ]
        Refinery.register_extension(Refinery::Calendar)
        tabs.each do |t|
          Refinery::Calendar::Tab.register do |tab|
            tab.name = t[:title]
            tab.partial = "/refinery/calendar/admin/events/tabs/#{t[:partial]}"
          end
        end
      end
    end
  end
end
