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
    data = {name: @message.user.name, time: @message.created_at, text: @message.text}
    if @message.save
      respond_to do |format|
        format.json { render json: data }
        format.html { redirect_to action: 'index' }
      end
    else
      @message.errors.full_messages.each{ |e| flash[:notice] = e}
      redirect_to action: 'index'
    end
  end

  private

  def message_params
    params.require(:message).permit(:text,:image).merge(group_id: params[:group_id])
  end
end
