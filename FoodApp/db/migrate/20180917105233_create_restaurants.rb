class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
      t.string "name"
      t.string "location"
      t.boolean "vegetarian_tag"
      t.integer "rate_for_two"
      t.timestamps
    end
  end
end
