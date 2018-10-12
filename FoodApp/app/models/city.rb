# list of cities
class City < ApplicationRecord
  validates_presence_of :name
  has_many :restaurants
end
