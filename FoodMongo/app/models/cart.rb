class Cart
  include Mongoid::Document

  validates_presence_of :name, :quantity, :amount, :restaurant_id

  belongs_to :user,foreign_key: :user_id
  field :name,type: String
  field :amount,type: Integer
  field :quantity, type: Integer
  field :restaurant_id 
end
