class CreateInvites < ActiveRecord::Migration[5.1]
  def change
    create_table :invites do |t|
      t.integer :user_id
      t.integer :event_id

      t.timestamps null: false
    end
  end
end
