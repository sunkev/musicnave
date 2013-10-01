class Lesson < ActiveRecord::Base
  belongs_to :teacher, class_name: 'User'
  has_many :comments,
    inverse_of: :lesson
end

