class RestaurantsController < ApplicationController
  load_and_authorize_resource :restaurant
  before_action :authenticate_user!
  before_action :set_restaurant, only: %i[show edit update destroy]
  # GET /restaurants
  # GET /restaurants.json
  def index
    if current_user.type_of_u=='restaurant'
      redirect_to owners_restaurants_url
    end
    if params[:name].nil? && params[:location].nil?
      @restaurants = Restaurant.all
    elsif params[:name].nil?
      @restaurants = Restaurant.where(location: params[:location])
    else
      @restaurant = Restaurant.find_by(name: params[:name])
    end
  end

  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
    @menu_items=MenuItem.where(restaurant_id: @restaurant.id)
  end

  # private
  #   # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

end
