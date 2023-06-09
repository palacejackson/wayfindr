class UsersController < ApplicationController
  def show
    @user = current_user
    @trips = current_user.trips.all
    @trip = Trip.new
  end
end
