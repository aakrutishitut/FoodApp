# frozen_string_literal: true

class Order
  include Mongoid::Document
  include Mongoid::Timestamps
  validates_presence_of :payment_mode

   after_create :cart_to_ordered_items

  belongs_to :user, foreign_key: :user_id
  belongs_to :restaurant, foreign_key: :restaurant_id
  has_many :items, dependent: :delete_all
  field :order_time, type: Integer
  field :status, type: String
  field :payment_mode, type: String
  field :total, type: Integer

  private
  
  def cart_to_ordered_items 
    @current_items = Cart.all
    @current_items.each do |current_item|
      @item = Item.new
      @item.name = current_item.name
      @item.quantity = current_item.quantity
      @item.amount = current_item.amount
      @item.order_id = @order.id
      @item.save
      UserMailer.order_confirmation(current_user.email).deliver_later
    end
    Cart.destroy_all
  end

end
