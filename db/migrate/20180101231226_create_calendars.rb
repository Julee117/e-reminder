class CreateCalendars < ActiveRecord::Migration[5.1]
  def change
    create_table :calendars do |t|
      t.integer :user_id
      t.string :name

      t.timestamps null: false
    end
  end
end
