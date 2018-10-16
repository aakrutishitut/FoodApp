class Item
  include Mongoid::Document

  validates_presence_of :name
  validates_presence_of :quantity
  validates_presence_of :amount
  validates_presence_of :order_id


  belongs_to :order,foreign_key: :order_id
  field :name,type: String
  field :amount,type: Integer
  field :quantity, type: Integer
end
