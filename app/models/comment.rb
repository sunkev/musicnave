class Comment < ActiveRecord::Base

  validates_presence_of :body

  belongs_to :lesson,
    inverse_of: :comments

  belongs_to :user,
    inverse_of: :comments

end