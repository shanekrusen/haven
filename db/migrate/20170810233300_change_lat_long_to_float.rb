class ChangeLatLongToFloat < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :lat, :float
    change_column :users, :long, :float
  end
end
