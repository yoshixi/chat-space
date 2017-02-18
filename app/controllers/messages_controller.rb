class MessagesController < ApplicationController
  def index
    @groups = current_user.groups
    @group = Group.find(params[:group_id])
    @message =  Message.new
    @messages = @group.messages
    @members = @group.users
  end

  def create
    @message = Message.new(user_id: current_user.id,group_id: params[:group_id])
    @message.update(message_params)
    flash[:notice] = "送信失敗！"  unless  @message.save
    redirect_to action: 'index'
  end

  private

  def message_params
    params.require(:message).permit(:text,:image)
  end
end
