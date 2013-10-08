class EnrollmentsController < ApplicationController
  # def create
  #    @enrollment = Entrollment.new(comment_params)
  # end

  private
  def comment_params
    params.require(:enrollments).permit(:lesson_id, :user_id)
  end
end