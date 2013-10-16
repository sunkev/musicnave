class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :username

  has_many :comments
  has_many :enrollments
  has_many :sent_messages, class_name: 'PrivateMessage',
    inverse_of: :sender,
    foreign_key: :sender_id

  has_many :received_messages, class_name: 'PrivateMessage',
    inverse_of: :recipient,
    foreign_key: :recipient_id

  mount_uploader :photo, ProfilePhotoUploader

  def full_name
    "#{first_name} #{last_name}"
  end

  def name_and_username
    "#{first_name} #{last_name} (#{username})"
  end

  def abv_name
    "#{first_name} #{last_name[0]}."
  end

  def all_conversations
    conversation_array = []
    self.sent_messages.each do |pm|
      conversation_array << pm.recipient_id
    end
    self.received_messages.each do |pm|
      conversation_array << pm.sender_id
    end
    conversation_array.uniq!
  end
end
