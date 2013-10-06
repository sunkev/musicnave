class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = current_user

    if params[:user] && @user.update_attributes!( user_params )
      redirect_to user_path(current_user), notice: 'Photo Updated'
    else
      flash[:alert] = 'Please provide a photo'
      render :show
    end


  end


  def user_params
    params.require(:user).permit(:photo)
  end

end
