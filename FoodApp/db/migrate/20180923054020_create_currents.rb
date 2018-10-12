class CreateCurrents < ActiveRecord::Migration[5.0]
  def change
    create_table :currents do |t|
      t.string "name"
      t.integer "quantity"
      t.float "amount"
      t.references :menu_item
      t.timestamps
    end
  end
end
