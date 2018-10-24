# frozen_string_literal: true

class HardWorker
  include Sidekiq::Worker

  def perform(args)
    json = JSON.parse(args).with_indifferent_access
    order_id = json['_id']
    # order_current = Order.where(_id: order_id['$oid'])
    order_current=Order.find_by(_id: order_id['$oid'])
    order_current.status = 'Delivered'
    order_current.save
  end
end
