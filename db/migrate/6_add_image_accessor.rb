class AddImageAccessor < ActiveRecord::Migration[4.2]
  def up

    add_column :refinery_calendar_events, :main_image_uid,  :string
    add_column :refinery_calendar_events, :main_image_name, :string

  end

  def down

    remove_column :refinery_calendar_events, :main_image_uid
    remove_column :refinery_calendar_events, :main_image_name

  end
end
