class Profile::LessonsController < ApplicationController

  before_filter :authenticate_user!

  def index
    @lessons =[]
    @enrollments = Enrollment.where(user_id: current_user.id)
    @enrollments.each do |enrollment|
      @lessons << Lesson.find(enrollment.lesson_id)
    end
    @lessons.concat(Lesson.where(teacher_id: current_user.id))
  end
end