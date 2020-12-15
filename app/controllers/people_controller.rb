class PeopleController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @groups = Group.all.sort_by(&:name)
  end
end
