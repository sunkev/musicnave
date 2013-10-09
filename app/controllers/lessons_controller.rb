class LessonsController < ApplicationController
  before_filter :authenticate_user!, only: [:create, :enroll]

  def index
    @lessons = Lesson.where(private: false)
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
    @comment = Comment.new
    if Enrollment.create(lesson_id: @lesson.id, user_id: current_user.id)
      flash[notice] = 'You are enrolled!'
      render :show
    else
      flash[notice] = 'You are not enrolled!'
      render :show
    end
  end

  def make_private
    @lesson = Lesson.find(params[:id])
    @comment = Comment.new
    changed_private_value = @lesson.privacy_changer
    if Lesson.update(@lesson, private: changed_private_value)
      flash[notice] = 'You made the lesson private'
      render :show
    else
      flash[notice] = 'You have not made the lesson private'
      render :show
    end
  end

  private
  def lesson_params
    params.require(:lesson).permit(:title, :private, :description, student_ids: [])
  end
end