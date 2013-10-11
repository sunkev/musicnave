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

  def edit
    @lesson = Lesson.find(params[:id])
  end

  def update
    @lesson = Lesson.find(params[:id])
    respond_to do |format|
      if @lesson.update(lesson_params)
        format.html { redirect_to @lesson, notice: 'Lesson was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
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
    update_params = {lesson_id: @lesson.id, user_id: current_user.id}

    if Enrollment.where(update_params) == []
      if Enrollment.create(update_params)
        flash[notice] = 'You are enrolled!'
        render :show
      else
        flash[notice] = 'You are not enrolled!'
        render :show
      end
    else
      flash[notice] = 'You are already enrolled!'
      render :show
    end
  end

  def update_privacy
    @lesson = Lesson.find(params[:id])
    @comment = Comment.new
    changed_private_value = @lesson.privacy_changer
    message = 'You have made the lesson '

    if Lesson.update(@lesson, private: changed_private_value)
      @lesson = Lesson.find(params[:id])
      @lesson.private ? flash[notice] = message + 'private' : flash[notice] = message + 'public'
      redirect_to @lesson
    else
      flash[notice] = 'Something went wrong'
      render :show
    end
  end

  private
  def lesson_params
    params.require(:lesson).permit(:title, :lesson_photo, :private, :description, student_ids: [])
  end
end