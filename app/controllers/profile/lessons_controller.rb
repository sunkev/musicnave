class Profile::LessonsController < ApplicationController

  before_filter :authenticate_user!

  def index
    @lessons = Lesson.where(teacher_id: current_user.id)
  end
end