class CreateCalendarVenues < ActiveRecord::Migration[4.2]

  def up
    create_table :refinery_calendar_venues do |t|
      t.string :name
      t.string :address
      t.string :url
      t.string :phone
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinery_calendar"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/calendar/venues"})
    end

    drop_table :refinery_calendar_venues

  end

end
