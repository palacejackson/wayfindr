class UsersController < ApplicationController
  def show
    @user = current_user
    @trips = current_user.trips
    @trip = Trip.new

    @markers = @trips.geocoded.map do |trip|
      {
        lat: trip.latitude,
        lng: trip.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { trip: trip }),
        map_marker_html: render_to_string(partial: "trips/map_marker")
      }
    end
  end
end
