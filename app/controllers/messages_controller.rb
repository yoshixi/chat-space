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
    if !@message.save
      @message.errors.full_messages.each do |e|
        flash[:notice] = e
      end
    end
    redirect_to action: 'index'
  end

  private

  def message_params
    params.require(:message).permit(:text,:image).merge(group_id: params[:group_id])
  end
end
