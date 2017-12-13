class AddUser2ToChatRoom < ActiveRecord::Migration[5.0]
  def change
    add_column :chat_rooms, :subscriber_id, :integer
  end
end
