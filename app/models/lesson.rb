class Lesson < ActiveRecord::Base
  validates_presence_of :title

  belongs_to :teacher,
    class_name: 'User'

  has_many :enrollments

  has_many :students,
    through: :enrollments,
    source: :user

  has_many :comments,
    inverse_of: :lesson

  accepts_nested_attributes_for :students
end
