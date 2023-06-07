class AddAddressAndPhoneNumberToActivities < ActiveRecord::Migration[7.0]
  def change
    add_column :activities, :address, :string
    add_column :activities, :phone_number, :string
  end
end
