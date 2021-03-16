class GroupsController < ApplicationController
  before_action :set_group, only: [ :show, :edit, :update ]
  before_action :authenticate_user!
  def index
    @group = Group.new
    if params[:query].present?
      @groups = Group.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @groups = Group.all
    end
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to groups_path(query: @group.name), notice: "#{@group.name.capitalize} wurde gespeichert!"
    else
      redirect_to groups_path, alert: @group.errors.full_messages
    end
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { render :show, notice: "#{@group.name.capitalize} wurde aktualisiert!" }
      else
        format.html { render :edit, alert: @group.errors.full_messages }
      end
    end
  end


  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :street, :number, :zip, :town, :country, :language)
  end
end
