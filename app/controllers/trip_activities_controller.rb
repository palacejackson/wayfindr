class TripActivitiesController < ApplicationController
  def update
    @trip_activity = TripActivity.find(params[:id])
    @old_dom_id = @trip_activity.id
    @trip = @trip_activity.trip
    @new_activity = @trip.remaining_activities.sample
    @trip_activity.update(activity: @new_activity)
    # TODO: put this in an if statement
    if @trip_activity.update(activity: @new_activity)
      respond_to do |format|
        format.html { redirect_to trip_path(@trip) }
      end
    end
  end
end
