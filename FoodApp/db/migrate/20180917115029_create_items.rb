class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string "name"
      t.integer "quantity"
      t.integer "amount"
      t.references :order 
      t.references :menu_item
      t.timestamps
    end
  end
end
