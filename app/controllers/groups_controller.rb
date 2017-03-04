class GroupsController < ApplicationController
  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
    @users = User.all
  end

  def create
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
      redirect_to action: 'index'
    else
      render :edit
    end
  end

  def search
    @users  = Group.search_name(params[:word],current_user)

  end
  private

  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end

end
