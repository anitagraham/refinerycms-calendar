class CreateCalendarEvents < ActiveRecord::Migration[4.2]

  def up
    create_table :refinery_calendar_events do |t|
      t.string :title
      t.date :from
      t.date :to
      t.string :registration_link
      t.string :excerpt
      t.text :description
      t.integer :positionw
      t.boolean :featured
      t.string :slug
      t.integer :venue_id

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinery_calendar"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/calendar/events"})
    end

    drop_table :refinery_calendar_events

  end

end
