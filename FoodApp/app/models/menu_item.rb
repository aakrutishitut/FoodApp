# stores items offered by the restaurant
class MenuItem < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :amount
  validates_presence_of :restaurant_id
  # belongs_to :item
  belongs_to :restaurant
end
