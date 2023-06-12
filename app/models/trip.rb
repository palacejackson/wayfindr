class Trip < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: :user_id
  has_many :trip_users
  # has_many :users, through: :trip_users
  has_many :trip_activities, dependent: :destroy
  has_many :activities, through: :trip_activities
  validates :destination, presence: true
  validates :number_of_guests, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :start_date, presence: true
  validates :end_date, presence: true

  geocoded_by :destination
  after_validation :geocode, if: :will_save_change_to_destination?

  def categories
  end

  def num_days
    (self.end_date - self.start_date).to_i
  end

  def selected_activities
    activities.where(id: trip_activities.where(locked: true).pluck(:activity_id))
  end

  def remaining_activities
    activities.where(id: trip_activities.where(locked: false).pluck(:activity_id))
  end

  def day_activities(day)
    activities.where(id: self.trip_activities.where(locked: true).where(day: day).pluck(:activity_id)).uniq
  end

  def activities_by_day
    days = []
    num_days.times do |num|
      p num
      p start_date + num.days
      p day_activities(start_date + num.days)
      days << self.day_activities(start_date + num.days)
    end
    p days
    return days
  end

end
