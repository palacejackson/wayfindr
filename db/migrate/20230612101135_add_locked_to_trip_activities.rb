class AddLockedToTripActivities < ActiveRecord::Migration[7.0]
  def change
    add_column :trip_activities, :locked, :boolean, default: false
    add_column :trip_activities, :day, :date
  end
end
