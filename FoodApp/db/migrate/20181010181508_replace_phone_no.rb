class ReplacePhoneNo < ActiveRecord::Migration[5.0]
  def change
  	remove_column :users, :phone_no
  	add_column :users, :phone_no, :string
  end
end
