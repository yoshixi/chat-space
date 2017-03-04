class GroupsController < ApplicationController
  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
    @users = User.all
  end

  def create
    binding.pry
    @group =  Group.new(group_params)
     if @group.save
       redirect_to action: 'index'
     else
       render :new
     end
  end

  def edit
    @group = Group.find(params[:id])
    @users = @group.users
  end

  def update
    @group = Group.find(params[:id])
    if @group.update_attributes(group_params)
      redirect_to :index
    else
      render :edit
    end
  end

  def search
    @users  = search_name
  end
  private

  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end

end
