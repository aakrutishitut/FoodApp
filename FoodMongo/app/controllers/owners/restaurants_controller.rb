# frozen_string_literal: true

class Owners::RestaurantsController < ApplicationController
  authorize_resource class: Owners
  load_and_authorize_resource class: Owners::Restaurant
  before_action :set_owners_restaurant, only: %i[show edit update destroy]
  def index
    redirect_to owners_restaurant_url(@restaurant) if restaurant_exists?
  end

  # GET /owners/restaurants/1
  # GET /owners/restaurants/1.json
  def show
    @city = City.find_by(id: @restaurant.city_id)
    @sum = @restaurant.reviews.avg(:rating)
    @restaurant = Restaurant.find_by(user_id: current_user.id)
    @menu_items = MenuItem.where(restaurant_id: @restaurant.id)
  end

  # GET /owners/restaurants/new
  def new
    @owners_restaurant = Restaurant.new
  end

  # GET /owners/restaurants/1/edit
  def edit; end

  # POST /owners/restaurants
  # POST /owners/restaurants.json
  def create
    @restaurant = Restaurant.new(restaurant_params)
    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to owners_restaurant_url(@restaurant), notice: 'Restaurant was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /restaurants/1
  # PATCH/PUT /restaurants/1.json
  def update
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /restaurants/1
  # DELETE /restaurants/1.json
  def destroy
    @restaurant.destroy
    respond_to do |format|
      format.html { redirect_to restaurants_url, notice: 'Restaurant was successfully destroyed.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_owners_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def restaurant_params
    params.require(:restaurant).permit(:name, :city_id, :location, :rate_for_two, :vegetarian_tag, :image, :user_id)
  end

  def restaurant_exists?
    @restaurant = Restaurant.find_by(user_id: current_user.id)
    if @restaurant.nil?
      false
    else
      true
    end
  end
end
