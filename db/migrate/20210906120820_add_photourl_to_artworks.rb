class AddPhotourlToArtworks < ActiveRecord::Migration[6.0]
  def change
    add_column :artworks, :photo_url, :string
  end
end
