class CreateArtistInvitations < ActiveRecord::Migration[6.0]
  def change
    create_table :artist_invitations do |t|
      t.integer :status, default: 0
      t.references :expo, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
