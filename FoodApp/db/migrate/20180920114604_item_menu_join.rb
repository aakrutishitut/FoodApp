class ItemMenuJoin < ActiveRecord::Migration[5.0]
  def change
  	create_table :ItemMenuJoin do |t|
      t.references :item
      t.references :menu
      t.integer "quantity"
      t.integer "amount"
      t.timestamps
    end
  end
end
