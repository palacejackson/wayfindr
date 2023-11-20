class TripsController < ApplicationController
  def show
    @trip = Trip.find_by_id(params[:id])
    @trip_activities = @trip.activities_by_day
    @remaining_activities = @trip.remaining_activities
    @trip_activity_ids = TripActivity.where(trip_id: Trip.find(params[:id]), locked: true).pluck(:activity_id)
    @activities = Activity.where(id: @trip_activity_ids)
    @activity_markers = @activities.geocoded.map do |a|
      {
        lat: a.latitude,
        lng: a.longitude,
        info_window_html: render_to_string(partial: "activitymap_info", locals: { activity: a }),
        map_marker_html: render_to_string(partial: "marker")
      }
    end

    @transparent = true
    @fixed = true
  end

  def new
    @trip = Trip.new
    @categories = Category.pluck(:name)
    @transparent = true
    @fixed = true
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
        used_types = []
        3.times do
          if @trip.remaining_activities.empty?
            TripActivity.create(activity: @trip.activities.sample, trip: @trip, day: day, locked: true)
          else
            trip_activity = @trip.trip_activities.where(activity: @trip.remaining_activities.filter { |a| !used_types.include?(a.activity_type)}.sample).first
            unless trip_activity
              trip_activity = @trip.trip_activities.where(activity: @trip.remaining_activities.sample).first
            end
            trip_activity.update(day: day, locked: true)
            used_types << trip_activity.activity.activity_type
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
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    redirect_to user_show_path, status: :see_other
  end

  private

  def trip_params
    params.require(:trip).permit(:destination, :number_of_guests, :start_date, :end_date, categories: [])
  end
end
