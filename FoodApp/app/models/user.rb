# stores data about user
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  belongs_to :restaurant
  has_many :reviews
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  validates :name, length: { within: 8..25 }
  validates :phone_no, length: { is: 10 }

  after_destroy do |user|
    restaurant = Restaurant.find_by_user_id(user.id)
    restaurant.destroy
  end
end
