class GroupsController < ApplicationController
  def index
    #code
  end
  def new
    @group = Group.new
  end
  def create
    @group =  Group.new(group_params)
    @group.save
    redirect_to action: :index
  end
  def edit
    @group = Group.find(params[:id])
  end
  def update
    @group = Group.find(params[:id])
    if @group.update_attributes(group_params)
      redirect_to action: :index
    else
      render 'new'
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end
end
