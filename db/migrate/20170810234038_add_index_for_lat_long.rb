class AddIndexForLatLong < ActiveRecord::Migration[5.0]
  def change
    add_index :users, [:lat, :long]
    add_index :users, :lat
    add_index :users, :long
  end
end
