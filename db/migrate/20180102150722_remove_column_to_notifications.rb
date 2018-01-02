class RemoveColumnToNotifications < ActiveRecord::Migration[5.1]
  def change
    remove_column :notifications, :user_id
  end
end
