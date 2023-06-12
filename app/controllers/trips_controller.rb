class TripsController < ApplicationController
  def show
    @trip = Trip.find(params[:id])
    @trip_activities = @trip.activities_by_day
    @remaining_activities = @trip.remaining_activities
    @transparent = true
  end

  def new
  end

  def create
    categories = trip_params[:categories]
    # trip_params.delete(:categories)
    @trip = Trip.new(trip_params.slice(:destination, :number_of_guests, :start_date, :end_date))
    @trip.creator = current_user

    if categories.size >= 4
      categories.each do |category|
        activities = Activity.all.select do |activity|
          category == activity.activity_type && @trip.destination == activity.location
        end
        p activities
        activities = activities.uniq { |a| a.name }
        @trip.activities << activities
      end
      @trip.save

      @trip.num_days.times do |num|
        day = @trip.start_date + num.days
        p day
        3.times do
          if @trip.remaining_activities.empty?
            @trip.trip_activities.where(activity: @trip.remaining_activities.sample).first.update(day: day, locked: true)
          else
            @trip.trip_activities.where(activity: @trip.activities.sample).first.update(day: day, locked: true)
          end
        end
      end
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
