class AddLatLongToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :lat_long, :string
  end
end
