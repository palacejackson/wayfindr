class ChangeIntegerToFloatInActivities < ActiveRecord::Migration[7.0]
  def change
    change_column :activities, :rating, :float
  end
end
