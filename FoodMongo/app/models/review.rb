# frozen_string_literal: true

class Review
  include Mongoid::Document
  embedded_in :restaurant, inverse_of: :reviews
  field :user_id
  field :rating, type: Integer
  field :comment, type: String
end
