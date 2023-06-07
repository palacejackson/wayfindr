class RenameOpeningHours < ActiveRecord::Migration[7.0]
  def change
    rename_column :activities, :opening_hous, :opening_hours
  end
end
