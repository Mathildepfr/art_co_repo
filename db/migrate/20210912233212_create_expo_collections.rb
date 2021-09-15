class CreateExpoCollections < ActiveRecord::Migration[6.0]
  def change
    create_table :expo_collections do |t|
      t.integer :status, null: false, default: 0
      t.references :expo, null: false, foreign_key: true
      t.references :collection, null: false, foreign_key: true

      t.timestamps
    end
  end
end
