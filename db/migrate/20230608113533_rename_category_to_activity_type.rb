class RenameCategoryToActivityType < ActiveRecord::Migration[7.0]
  def change
    rename_column :activities, :category, :activity_type
  end
end
