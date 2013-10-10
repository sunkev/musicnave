class EnrollmentsController < ApplicationController

  private
  def comment_params
    params.require(:enrollments).permit(:lesson_id, :user_id)
  end
end