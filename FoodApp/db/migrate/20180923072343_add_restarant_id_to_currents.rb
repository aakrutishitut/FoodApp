class AddRestarantIdToCurrents < ActiveRecord::Migration[5.0]
  def change
  	add_column :currents, :restaurant_id , :integer
  end
end
