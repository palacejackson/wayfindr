if @trip_activity.persisted?
  json.inserted_item render(partial: "trip_activity", formats: :html, locals: { activity: @trip_activity, trip: @trip })
end
