class AddFieldsToReviews < ActiveRecord::Migration[5.0]
  def change
  	add_column :reviews, :rating, :int
  	add_column :reviews, :comment, :text
  	add_column :reviews, :user_id , :int
  	add_column :reviews, :restaurant_id, :int
  	add_foreign_key :reviews, :users
  	add_foreign_key :reviews, :restaurants
  end
end
