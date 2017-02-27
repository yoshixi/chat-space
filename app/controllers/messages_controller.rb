class MessagesController < ApplicationController
  def index
    @groups = current_user.groups
    @group = Group.find(params[:group_id])
    @message =  Message.new
    @messages = @group.messages
    @members = @group.users
  end

  def create
    @message = current_user.messages.new(message_params)
    if @message.save
      respond_to do |format|
        format.json { render 'index.json' }
        format.html { redirect_to action: 'index' }
      end
    else
      respond_to do |format|
        format.json { render 'error.json' }
        format.html { redirect_to action: 'index' }
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:text,:image).merge(group_id: params[:group_id])
  end
end
