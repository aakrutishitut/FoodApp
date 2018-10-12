class AddFieldsToItems < ActiveRecord::Migration[5.0]
  def change
  	add_column :items, :restaurant_id, :int
  	add_foreign_key :items,:restaurants
  end
end
