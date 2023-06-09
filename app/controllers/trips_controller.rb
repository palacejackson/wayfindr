class TripsController < ApplicationController
  def show
    @trip = Trip.find(params[:id])
    @trip_activities = []
    @trip.num_days.times do
      activities = []
      start = Time.now
      3.times do
        activity = @trip.activities.sample
        while activities.any? { |act| act.activity_type == activity.activity_type || @trip_activities.flatten.include?(activity)}
          activity = @trip.activities.sample
          break if (Time.now - start) > 20
        end
        activities << activity
      end
      @trip_activities << activities
    end
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

    if categories.size >= 4
      @trip.save
      redirect_to trip_path(@trip)
    else
      @trip.errors.add(:categories, "You must choose at least 4 categories")
      @categories = Category.all.map do |category|
        category.name
      end
      # render :template => "trips/_form", status: :unprocessable_entity
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
