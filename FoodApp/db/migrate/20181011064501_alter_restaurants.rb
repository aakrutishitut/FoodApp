class AlterRestaurants < ActiveRecord::Migration[5.0]
  def change
  	remove_column :restaurants, :city
  	add_column :restaurants , :city_id, :int
  end
end
