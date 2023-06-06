class TripsController < ApplicationController
  def show
    @trips = Trip.find(params[:id])
  end

  def new
  end

  def create
    @trips = Trip.new(trip_params)
  end

  def edit
  end

  def update
  end

  private

  def trip_params
    params.require(:trip).permit(:destination, :number_of_guests, :start_date, :end_date)
  end
end
