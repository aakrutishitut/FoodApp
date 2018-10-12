class HardWorker
  include Sidekiq::Worker

  def perform(args)
  	json = JSON.parse(args).with_indifferent_access
  	order_id=json['id']
    order_current=Order.find_by_id(order_id)
    order_current.status="Delivered"
    order_current.save
  end
end
