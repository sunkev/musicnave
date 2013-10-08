class CommentsController < ApplicationController
  before_filter :authenticate_user!, except: [:index]

  def create
    @lesson = Lesson.find(params[:lesson_id])
    @comment = current_user.comments.build(comment_params)
    @comment.lesson = @lesson

    if @comment.save
      redirect_to lesson_path(@lesson),
      notice: "Successful comment"
    else
      flash[:notice] = "Unsuccessful comment"
      render "lessons/show"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:lesson_id, :body, :user_id)
  end
end