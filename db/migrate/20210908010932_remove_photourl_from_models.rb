class RemovePhotourlFromModels < ActiveRecord::Migration[6.0]
  def change
    remove_column :artworks, :photo_url
    remove_column :users, :photo_url
  end
end
