class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @group = Group.last
  end
end
