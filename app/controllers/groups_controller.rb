class GroupsController < ApplicationController
  skip_before_action :authenticate_user!
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  def show
    @group = Group.find(params[:id])
  end

  private

  def group_params
    params.require(:group).permit(:name, :street, :number, :zip, :town, :country, :language)
  end
end
