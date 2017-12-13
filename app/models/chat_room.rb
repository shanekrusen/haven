class ChatRoom < ApplicationRecord
  belongs_to :user
  belongs_to :subscriber, :class_name => "User", :foreign_key => "subscriber_id"
  has_many :messages, dependent: :destroy
end
