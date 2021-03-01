class GroupsController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @person = Person.new
    @group = Group.new
    if params[:query].present?
      @groups = Group.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @groups = Group.all.sort_by(&:name)
    end
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      # @groups = Group.all.sort_by(&:name)
      redirect_to groups_path(query: @group.name), notice: "#{@group.name.capitalize} wurde gespeichert!"
    else
      redirect_to groups_path, alert: @group.errors.full_messages
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
