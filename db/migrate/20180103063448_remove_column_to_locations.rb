class RemoveColumnToLocations < ActiveRecord::Migration[5.1]
  def change
    remove_column :locations, :user_id 
  end
end
