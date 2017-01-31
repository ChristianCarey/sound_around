class CreateArtistEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :artist_events do |t|
      t.references :artist, foreign_key: true
      t.references :event, foreign_key: true

      t.timestamps
    end
    add_index :artist_events, [:artist_id, :event_id], unique: true
  end
end
