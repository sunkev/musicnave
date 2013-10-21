class Lesson < ActiveRecord::Base
  validates_presence_of :title
  validates :private, inclusion: [true, false]
  validates_presence_of :state
  validates_presence_of :city

  validates_inclusion_of :state,
    in: STATES

  belongs_to :teacher,
    class_name: 'User'

  has_many :enrollments

  has_many :students,
    through: :enrollments,
    source: :user

  has_many :comments,
    inverse_of: :lesson

  accepts_nested_attributes_for :students

  mount_uploader :lesson_photo, LessonPhotoUploader

  def privacy_changer
    private ? false : true
  end

  def student_counter(count)
    if count == 1
      "student"
    else
      "students"
    end
  end
end
