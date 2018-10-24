# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default from: 'ramarathore76@gmail.com'

  def order_history(email)
    attachments.inline['order_history.xls'] = File.read(Rails.root.join('order_history.xls'))
    mail(to: email.to_s, subject: 'Order history on FoodApp')
  end

  def order_confirmation(email)
    mail(to: email.to_s, subject: 'Your order has been confirmed')
  end
end
