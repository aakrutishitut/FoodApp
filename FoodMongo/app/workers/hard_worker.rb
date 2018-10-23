# frozen_string_literal: true

class HardWorker
  include Sidekiq::Worker

  def perform(args)
    json = JSON.parse(args).with_indifferent_access
    order_id = json['_id']
    byebug
    order_current = Order.where(_id: order_id)
    order_current.status = 'Delivered'
    order_current.save
  end
end
