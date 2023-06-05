class CreateActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :activities do |t|
      t.string :location
      t.string :type
      t.string :name
      t.text :details
      t.integer :rating
      t.string :image_url
      t.string :website_url
      t.boolean :daytime

      t.timestamps
    end
  end
end
