class Inbox::PrivateMessagesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @message = PrivateMessage.new
  end

  def create
    @message = current_user.sent_messages.build(message_params)

    if @message.save
      render :index, notice: "Message sent"
    else
      render :new
    end
  end

  def show
    @messages = PrivateMessage.where("(recipient_id = ? AND sender_id = ?) OR (recipient_id = ? AND sender_id = ?)", params[:id], current_user.id, current_user.id, params[:id])

    respond_to do |format|
      format.html { render 'index' }# show.html.erb
      format.json { render :show }
    end
  end

  private
  def message_params
    params.require(:private_message).permit(:recipient_id, :body)
  end
end