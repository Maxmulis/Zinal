class PeopleController < ApplicationController
  before_action :authenticate_user!
  before_action :set_paper_trail_whodunnit
  before_action :set_person, only: [ :show, :edit, :update ]
  def index
    @people = Person.includes(:group).sort_by { |person| person.group.name }
  end

  def new
    @person = Person.new
    @group = Group.find(params[:group_id])
  end

  def show
  end

  def create
    @person = Person.new(person_params)
    group = Group.find(params[:group_id])
    @person.group = group
    respond_to do |format|
      if @person.save
        format.html { redirect_to group_people_path(group) }
        #format.turbo_stream { render turbo_stream: turbo_stream.prepend(group, partial: 'people/person', locals: { person: @person })}
      else
        render :new
      end
    end
  end

  def edit
    @group = @person.group
  end

  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { render :show, notice: "#{@person.firstname.capitalize} wurde aktualisiert!"}
      else
        format.html { render :edit, alert: @person.errors.full_messages }
      end
    end
  end

  def people
    @group = Group.find(params[:group_id])
    @people = @group.people.includes(photo_attachment: :blob)
  end

  private

  def set_person
    @person = Person.find(params[:id])
  end

  def person_params
    params.require(:person).permit(:firstname, :phone, :comment, :birthdate)
  end

end
