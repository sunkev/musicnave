class Inbox::PrivateMessagesController < ApplicationController
  before_filter :authenticate_user!

  def index
  end

  def show
    @messages = PrivateMessage.where("(recipient_id = ? AND sender_id = ?) OR (recipient_id = ? AND sender_id = ?)", params[:id], current_user.id, current_user.id, params[:id])

    respond_to do |format|
      format.html { render 'index' }# show.html.erb
      format.json { render :show }
    end
  end
end