class UsersController < ApplicationController
  def show
    @user = current_user
    @trips = current_user.trips
    @trip = Trip.new

    @past_trips = []
    @trips.each do |trip|
      @past_trips << trip if trip.start_date < Date.today
    end
    @past_hidden_trips = @past_trips.drop(4)

    @upcoming_trips = []
    @trips.each do |trip|
      @upcoming_trips << trip if trip.start_date > Date.today || trip.start_date == Date.today
    end

    @upcoming_hidden_trips = @upcoming_trips.drop(3)

    @markers = @trips.geocoded.map do |trip|
      {
        lat: trip.latitude,
        lng: trip.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { trip: trip }),
        map_marker_html: render_to_string(partial: "trips/marker")
      }
    end
    @categories = Category.pluck(:name)
  end
end
