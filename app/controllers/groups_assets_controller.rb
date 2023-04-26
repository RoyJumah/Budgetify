class GroupsAssetsController < ApplicationController
  def new
    @asset = Asset.new
    @groups = Group.where(user: current_user)
  end

  def create
    asset = Asset.create(name: asset_params[:name], authorid: current_user.id, amount: asset_params[:amount])

    if asset.save
      GroupsAsset.create(asset_id: asset.id, group_id: params[:group])
      redirect_to group_path(params[:group])
    else
      flash[:notice] = 'Error during creation'
    end
  end

  private

  def asset_params
    params.require(:asset).permit(:name, :amount)
  end
end
