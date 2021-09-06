class CreateArtworks < ActiveRecord::Migration[6.0]
  def change
    create_table :artworks do |t|
      t.string :title
      t.string :description
      t.integer :price
      t.string :size
      t.boolean :available
      t.string :type
      t.string :style
      t.references :collection, null: false, foreign_key: true

      t.timestamps
    end
  end
end
