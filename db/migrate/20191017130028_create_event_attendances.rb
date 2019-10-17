class CreateEventAttendances < ActiveRecord::Migration[6.0]
  def change
    create_table :event_attendances do |t|
      t.integer "user_id"
      t.integer "event_id"
      t.timestamps
    end
  end
end
