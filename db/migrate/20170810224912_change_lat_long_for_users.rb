class ChangeLatLongForUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :lat_long
    add_column :users, :lat, :decimal
    add_column :users, :long, :decimal
  end
end
