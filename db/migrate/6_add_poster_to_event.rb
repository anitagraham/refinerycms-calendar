class AddPosterToEvent < ActiveRecord::Migration[4.2]
  def up
    add_column :refinery_calendar_events, :poster_id, :integer
    add_column :refinery_calendar_events, :poster_title, :string
  end

  def down
    remove_column :refinery_calendar_events, :poster_id
    remove_column :refinery_calendar_events, :poster_title
  end
end
