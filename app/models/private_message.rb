class PrivateMessage < ActiveRecord::Base
  validates_presence_of :body
  belongs_to :sender, class_name: 'User',
    inverse_of: :sent_messages
  belongs_to :recipient, class_name: 'User',
    inverse_of: :received_messages
end