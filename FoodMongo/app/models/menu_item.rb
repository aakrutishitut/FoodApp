class MenuItem
  include Mongoid::Document

  validates_presence_of :name, :amount

  belongs_to :restaurant, foreign_key: :restaurant_id
  field :name,type: String
  field :amount,type: Integer
end
