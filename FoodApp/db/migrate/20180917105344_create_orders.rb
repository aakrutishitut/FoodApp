class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer "order_time"
      t.string "status"
      t.string "payment_mode"
      t.float "total"
      t.references :user
      t.integer "restaurant_id"
      t.timestamps
    end
  end
end
