class CreateVenues < ActiveRecord::Migration[6.0]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :address
      t.string :type_of_venue
      t.string :venue_url
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
