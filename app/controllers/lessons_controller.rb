class LessonsController < ApplicationController
  before_action :set_lesson, only: [:new]

  def index
    @lessons = Lesson.all
  end

  def new
  end

  def create

    @lesson = Lesson.new(lesson_params)
    @lesson.teacher_id = current_user.id
    if @lesson.save!
      redirect_to new_lesson_path
      flash[notice] = 'Lesson successfully created'
    else
      redirect_to new_lesson_path
      flash[notice] = 'Lesson was not successfully created'
    end

  end


  private

  def set_lesson
    @lesson = Lesson.new
  end

  def lesson_params
    params.require(:lesson).permit(:title, :description, :teacher_id)
  end
end