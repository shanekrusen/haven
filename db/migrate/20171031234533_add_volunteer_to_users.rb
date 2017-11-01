class AddVolunteerToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :volunteer, :boolean
  end
end
