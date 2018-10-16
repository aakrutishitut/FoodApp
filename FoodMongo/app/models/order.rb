class Order
  include Mongoid::Document
  validates_presence_of :payment_mode

  belongs_to :user,foreign_key: :user_id
  belongs_to :restaurant,foreign_key: :restaurant_id
  field :order_time, type: Integer
  field :status, type: String
  field :payment_mode, type: String
  field :total, type: Integer
end
