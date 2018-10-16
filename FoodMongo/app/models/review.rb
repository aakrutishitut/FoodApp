class Review
  include Mongoid::Document
  belongs_to :restaurants,foreign_key: :restaurant_id
  field :user_id
  field :rating, type: Integer
  field :comment, type: String
end
