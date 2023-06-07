class DeleteOpeningHoursFromActivities < ActiveRecord::Migration[7.0]
  def change
    remove_column :activities, :opening_hours
  end
end
