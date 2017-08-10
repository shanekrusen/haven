class FixLatLongForUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :lat, :decimal, {:precision=>10, :scale=>6}
    change_column :users, :long, :decimal, {:precision=>10, :scale=>6}
  end
end
