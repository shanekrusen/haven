class AddServicesToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :services, :string
  end
end
