class TripsController < ApplicationController
  def show
    @trips = Trip.find(params[:id])
  end

  def new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.creator = current_user
    if @trip.save
      redirect_to trip_path(@trip)
    else
      render 'pages/landing', status: :unprocessable_entity
    end
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
