class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.integer :calendar_id
      t.integer :event_id

      t.timestamps null: false
    end
  end
end
