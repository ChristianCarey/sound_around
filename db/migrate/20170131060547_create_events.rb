class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title
      t.references :venue, foreign_key: true
      t.datetime :datetime
      t.string :ticket_status
      t.string :ticket_url
      t.string :rsvp_url

      t.timestamps
    end
  end
end
