class AddFieldsToUser < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :name, :string
  	add_column :users, :phone_no, :integer
  	add_column :users, :home_add, :text
  	add_column :users, :work_add, :text
  end
end
