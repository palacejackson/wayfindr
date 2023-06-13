class UsersController < ApplicationController
  def show
    @user = current_user
    @trips = current_user.trips
    @trip = Trip.new

    @past_trips = []
    @trips.each do |trip|
      @past_trips << trip if trip.start_date < Date.today && trip.user_id == current_user.id
    end

    @upcoming_trips = []
    @trips.each do |trip|
      @upcoming_trips << trip if (trip.start_date > Date.today || trip.start_date == Date.today) && trip.user_id == current_user.id
    end

    @markers = @trips.geocoded.map do |trip|
      {
        lat: trip.latitude,
        lng: trip.longitude
      }
    end
  end
end
