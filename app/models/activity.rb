class Activity < ApplicationRecord
  has_many :trips, through: :trip_activities

  validates :location, presence: true

end
