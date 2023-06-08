class TripsController < ApplicationController
  def show
    @trips = Trip.find(params[:id])

  end

  def new
  end

  def create
    categories = trip_params[:categories]
    # trip_params.delete(:categories)
    @trip = Trip.new(trip_params.slice(:destination, :number_of_guests, :start_date, :end_date))
    @trip.creator = current_user
        categories.each do |category|
          activities = Activity.all.select do |activity|
            category == activity.activity_type && @trip.destination == activity.location
          end
          @trip.activities << activities
        end

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
    params.require(:trip).permit(:destination, :number_of_guests, :start_date, :end_date, categories: [])
  end
end
