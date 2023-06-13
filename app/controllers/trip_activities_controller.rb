class TripActivitiesController < ApplicationController
  def update
    @trip_activity = TripActivity.find(params[:id])
    p @trip_activity
    p @trip_activity.trip
    @trip = @trip_activity.trip
    @new_activity = @trip.remaining_activities.sample
    # TODO: put this in an if statement
    @trip_activity.update(activity: @new_activity)
    respond_to do |format|
      format.html { redirect_to trip_path(@trip), notice: "new activity generated" }
      format.json
    end
  end
end
