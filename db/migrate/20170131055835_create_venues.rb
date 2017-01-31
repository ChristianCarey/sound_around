class CreateVenues < ActiveRecord::Migration[5.0]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :city
      t.string :region
      t.string :country
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end
end
