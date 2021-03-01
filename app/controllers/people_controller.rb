class PeopleController < ApplicationController
  def create
    @person = Person.new(person_params)

  end

  def edit
  end

  def update
  end

  private

  def person_params
    params.require(:person).permit(:firstname, :phone, :comment, :birthdate)
  end

end
