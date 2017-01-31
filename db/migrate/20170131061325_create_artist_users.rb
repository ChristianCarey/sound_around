class CreateArtistUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :artist_users do |t|
      t.references :artist, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :artist_users, [:artist_id, :user_id], unique: true
  end
end
