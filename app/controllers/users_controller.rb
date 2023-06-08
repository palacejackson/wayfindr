class UsersController < ApplicationController
  def show
    @user = current_user
    @trips = current_user.trips.all
  end
end
