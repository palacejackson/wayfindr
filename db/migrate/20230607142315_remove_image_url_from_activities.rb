class RemoveImageUrlFromActivities < ActiveRecord::Migration[7.0]
  def change
    remove_column :activities, :image_url, :string
  end
end
