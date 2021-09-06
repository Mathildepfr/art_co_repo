class CreateExpos < ActiveRecord::Migration[6.0]
  def change
    create_table :expos do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.string :description
      t.references :venue, null: false, foreign_key: true

      t.timestamps
    end
  end
end
