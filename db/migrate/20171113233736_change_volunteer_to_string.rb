class ChangeVolunteerToString < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :volunteer, :string
  end
end
