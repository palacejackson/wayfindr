class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :trip_users
  has_many :trips, through: :trip_users
  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :username, presence: true, uniqueness: true
end
