class MessagesController < ApplicationController
  def index
    @groups = current_user.groups
    @group = Group.find(params[:group_id])
    @message =  Message.new
    @messages = @group.messages
    @members = @group.users
  end

  def create

    Message.create(create_params)
    redirect_to action: 'index'
  end

  private

  def create_params
    params.require(:message).permit(:text,:image).merge(group_id: params[:group_id], user_id: current_user.id)
  end
end
