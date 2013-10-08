class Enrollment < ActiveRecord::Base
  belongs_to :user
  belongs_to :lesson,
    inverse_of: :enrollments
end