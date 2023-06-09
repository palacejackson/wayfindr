class UsersController < ApplicationController
  def show
    @user = current_user
    @trips = current_user.trips.all
    @trip = Trip.new

    @markers = @trips.geocoded.map do |trip|
      {
        lat: trip.latitude,
        lng: trip.longitude
      }
    end
  end
end
