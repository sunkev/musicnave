class CommentsController < ApplicationController
  def index
    @lesson = Lesson.find(params[:lesson_id])
    @comments = @lesson.comments
  end

  def create
    @lesson = Lesson.find(params[:lesson_id])
    @comment = @lesson.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to lesson_path(@lesson),
        notice: "Successful comment"
    else
      redirect_to lesson_path(@lesson),
      notice: "Unsucessful comment"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:lesson_id, :body, :user_id)
  end
end