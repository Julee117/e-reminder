class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :start_time
      t.datetime :end_time
      t.datetime :date
      t.string :note
      t.string :creator
      t.integer :location_id

      t.timestamps null: false
    end
  end
end
