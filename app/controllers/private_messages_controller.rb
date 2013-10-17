class PrivateMessagesController < ApplicationController
  def index
  end

  def new
    @message = PrivateMessage.new
  end

  def create
    @message = current_user.sent_messages.build(message_params)

    if @message.save
      redirect_to inbox_private_messages_path, notice: "Message sent"
    else
      render :new
    end
  end

  def show
    @message = PrivateMessage.find(params[:id])
  end

  private
  def message_params
    params.require(:private_message).permit(:recipient_id, :body)
  end
end