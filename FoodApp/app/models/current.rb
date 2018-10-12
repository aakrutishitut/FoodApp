# stores list of ordered items temporarily
class Current < ApplicationRecord
  # has_many :menu_items
  validates_presence_of :name
  validates_presence_of :quantity
  validates_presence_of :amount
end
