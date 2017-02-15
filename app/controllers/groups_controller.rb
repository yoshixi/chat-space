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
  end
  def edit
    #code
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end
