class AddCoordinatesToTrip < ActiveRecord::Migration[7.0]
  def change
    add_column :trips, :latitude, :float
    add_column :trips, :longitude, :float
  end
end
