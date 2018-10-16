class Cart
  include Mongoid::Document

  validates_presence_of :name
  validates_presence_of :quantity
  validates_presence_of :amount
  validates_presence_of :restaurant_id


  belongs_to :user,foreign_key: :user_id
  field :name,type: String
  field :amount,type: Integer
  field :quantity, type: Integer
  field :restaurant_id 
end
