class Trip < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: :user_id
  has_many :trip_users
  has_many :users, through: :trip_users
  has_many :trip_activities
  has_many :activities, through: :trip_activities, dependent: :destroy
  validates :destination, presence: true
  validates :number_of_guests, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :start_date, presence: true
  validates :end_date, presence: true
  
  def categories
  end

  def num_days
    (self.end_date - self.start_date).to_i
  end
end
