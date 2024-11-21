class DropEventAttendances < ActiveRecord::Migration[8.0]
  def change
    drop_table :event_attendances
  end
end
