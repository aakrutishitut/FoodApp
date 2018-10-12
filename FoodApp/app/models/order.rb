# stores order details
class Order < ApplicationRecord
  # belongs_to :item
  belongs_to :user
  after_create :order_confirmation_email
  validates_presence_of :payment_mode
  validates_presence_of :user_id
  validates_presence_of :restaurant_id
  # validates_numericality_of :total, only_integer: true

  def order_confirmation_email
    NotifierMailer.confirmation_email.deliver_now
  end
end
