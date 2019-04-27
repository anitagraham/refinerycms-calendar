class AddPosterImage < ActiveRecord::Migration[4.2]
  def up

    add_column :refinery_calendar_events, :poster_uid,  :string
    add_column :refinery_calendar_events, :poster_name, :string

  end

  def down

    remove_column :refinery_calendar_events, :poster_uid
    remove_column :refinery_calendar_events, :poster_name

  end
end
