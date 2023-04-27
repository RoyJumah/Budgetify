class GroupsController < ApplicationController
  def index
    @groups = Group.where(user: current_user).includes(:groups_assets).order(created_at: :desc).limit(4)
    @name = current_user.name
  end

  def older_index
    @groups = Group.where(user: current_user).includes(:groups_assets).order(created_at: :asc)
  end

  def show
    @group = Group.find(params[:id])
    @groups_assets = GroupsAsset.includes(:asset).where(group_id: @group).order(created_at: :desc)
    @total = 0
    @groups_assets.each { |e| @total += e.asset.amount }
  end

  def new
    @group = Group.new
  end

  def create
    group = Group.new(group_params)
    group.user = current_user
    if group.save
      redirect_to authenticated_root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    group = Group.find(params[:id])
    group.destroy
    redirect_to authenticated_root_path
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
