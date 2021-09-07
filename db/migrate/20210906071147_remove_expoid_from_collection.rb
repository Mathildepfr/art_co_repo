class RemoveExpoidFromCollection < ActiveRecord::Migration[6.0]
  def change
    remove_column :collections, :expo_id
  end
end
