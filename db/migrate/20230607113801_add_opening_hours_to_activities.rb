class AddOpeningHoursToActivities < ActiveRecord::Migration[7.0]
  def change
    add_column :activities, :opening_hours, :string, array: true, default: []
  end
end
