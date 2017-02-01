class AddLatAndLngToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :lat, :float
    add_column :users, :lng, :float
    add_index :users, [:lat, :lng]
  end
end
