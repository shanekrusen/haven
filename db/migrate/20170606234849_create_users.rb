class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.integer :zip_code
      t.string :encrypted_password
      t.string :salt
      
      t.timestamps
    end
  end
end