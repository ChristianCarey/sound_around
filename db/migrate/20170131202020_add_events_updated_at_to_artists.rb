class AddEventsUpdatedAtToArtists < ActiveRecord::Migration[5.0]
  def change
    add_column :artists, :events_updated_at, :datetime
  end
end
