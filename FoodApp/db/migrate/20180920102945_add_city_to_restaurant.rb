class AddCityToRestaurant < ActiveRecord::Migration[5.0]
  def change
  	add_column :restaurants, :city, :int
  end
end
