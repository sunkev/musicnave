class LessonsController < ApplicationController
  before_filter :authenticate_user!, only: [:create, :enroll]

  def index
    @lessons = Lesson.all
  end

  def show
    @lesson = Lesson.find(params[:id])
    @comment = Comment.new
  end

  def new
    @lesson = Lesson.new
    @lesson.enrollments.build
  end

  def create
    @lesson = Lesson.new(lesson_params)
    @lesson.teacher_id = current_user.id
    if @lesson.save
      redirect_to lesson_path(@lesson)
      flash[notice] = 'Lesson successfully created'
    else
      flash[notice] = 'Lesson was not successfully created'
      render :new
    end
  end

  def enroll
    @lesson = Lesson.find(params[:id])
    if Enrollment.create(lesson_id: @lesson.id, user_id: current_user.id)
      flash[notice] = 'You are enrolled!'
      render :new
    else
      flash[notice] = 'You are not enrolled!'
      render :new
    end
  end

  private
  def lesson_params
    params.require(:lesson).permit(:title, :description, student_ids: [])
  end
end