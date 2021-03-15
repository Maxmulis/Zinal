class PeopleController < ApplicationController
  before_action :authenticate_user!
  def index
    @people = Person.includes(:group).sort_by { |person| person.group.name }
  end

  def new
    @person = Person.new
    @group = Group.find(params[:group_id])
  end

  def create
    @person = Person.new(person_params)
    group = Group.find(params[:group_id])
    @person.group = group
    if @person.save
      redirect_to groups_path(query: group.name)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def adults
    @group = Group.find(params[:group_id])
    @people = @group.people.select { |person| person.adult? }
  end

  def kids
    @group = Group.find(params[:group_id])
    @people = @group.people.select { |person| person.kid? }
  end

  private

  def person_params
    params.require(:person).permit(:firstname, :phone, :comment, :birthdate)
  end

end
