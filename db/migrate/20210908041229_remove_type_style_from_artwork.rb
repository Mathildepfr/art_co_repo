class RemoveTypeStyleFromArtwork < ActiveRecord::Migration[6.0]
  def change
    remove_column :artworks, :medium, :string
    remove_column :artworks, :style, :string
  end
end
