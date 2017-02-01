class AddRemoteIdToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :remote_id, :integer
    add_index :events, :remote_id, unique: :true
  end
end
