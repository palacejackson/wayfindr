class TripActivitiesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def update
    response = request.body.read
    trip_id = JSON.parse(response)
    id = params[:id]
    @trip_activity = TripActivity.find_by(activity_id: id, trip_id: trip_id, locked: true)
    @trip = Trip.find_by_id(trip_id)
    @new_activity = @trip.remaining_activities.sample
    @trip_activity.update(activity: @new_activity)
    @carousel = 0
    # TODO: put this in an if statement
    respond_to do |format|
      format.html { render partial: 'trip_activity/trip_activity', locals: { activity: @new_activity } }
    end
  end
end
