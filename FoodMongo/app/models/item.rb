# frozen_string_literal: true

class Item
  include Mongoid::Document

  validates_presence_of :name, :quantity, :amount, :order_id

  belongs_to :order, foreign_key: :order_id
  field :name, type: String
  field :amount, type: Integer
  field :quantity, type: Integer
end
