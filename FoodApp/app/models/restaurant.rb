# stored data about restaurant
class Restaurant < ApplicationRecord
  has_many :menu_items, dependent: :delete_all
  belongs_to :city
  has_one :user
  has_many :reviews, dependent: :delete_all
  mount_uploader :image, ImageUploader
  validates_presence_of :name
  validates_presence_of :rate_for_two
  validates_presence_of :location
  validates :name, length: { within: 8..25 }
  validates_numericality_of :rate_for_two, only_integer: true
  validates_uniqueness_of :user_id
end
