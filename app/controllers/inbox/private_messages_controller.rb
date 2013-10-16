class Inbox::PrivateMessagesController < ApplicationController

  before_filter :authenticate_user!

  def index
    # @current_user = User.find(current_user.id)
  end
end