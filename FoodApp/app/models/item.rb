# stores ordered items with order id
class Item < ApplicationRecord
  # has_many :orders
  # has_many :menu_items
  validates_presence_of :name
  validates_presence_of :quantity
  validates_presence_of :amount
  validates_presence_of :order_id
  validates_presence_of :menu_item_id
end
