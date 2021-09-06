class ChangeTypeToMedium < ActiveRecord::Migration[6.0]
  def change
    remove_column :artworks, :type
    add_column :artworks, :medium, :string
  end
end
