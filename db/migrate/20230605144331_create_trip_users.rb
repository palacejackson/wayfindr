class CreateTripUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :trip_users do |t|
      t.references :trip, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :editor

      t.timestamps
    end
  end
end
