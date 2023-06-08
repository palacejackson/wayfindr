class ChangeTypeOnActivities < ActiveRecord::Migration[7.0]
  def change
    remove_column :activities, :type, :string
    add_column :activities, :activity_type, :string
  end
end
