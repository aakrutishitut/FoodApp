# inherits from application controller
class RestaurantsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_restaurant, only: %i[show edit update destroy]
  load_and_authorize_resource :restaurant

  # GET /restaurants
  # GET /restaurants.json
  def index
    @restaurant_id_temp = Restaurant.find_by_user_id(current_user.id)
    if params[:name].nil?
      @menuitems = MenuItem.where(restaurant_id: @restaurant_id_temp)
    else
      @menuitems = MenuItem.where(restaurant_id: @restaurant_id_temp).where(name: params[:name])
    end
  end

  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
    @restaurant = Restaurant.find(params[:id])
    session[:restaurant_id] = params[:id]
  end

  # GET /restaurants/new
  def new
    @cities = City.all
    @restaurant = Restaurant.new
  end

  # GET /restaurants/1/edit
  def edit; end

  # POST /restaurants
  # POST /restaurants.json
  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user_id = current_user.id
    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to action: 'index' }
        format.json { render :show, status: :created, location: @restaurant }
        format.js {}
      else
        format.html {}
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
        format.js { render :new }
      end
    end
  end

  # PATCH/PUT /restaurants/1
  # PATCH/PUT /restaurants/1.json
  def update
    @restaurant.user_id = current_user.id
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to action: 'index' }
        format.json { render :show, status: :ok, location: @restaurant }
      else
        format.html { render :edit }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurants/1
  # DELETE /restaurants/1.json
  def destroy
    @restaurant.destroy
    respond_to do |format|
      format.html { redirect_to restaurants_url, notice: 'Restaurant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def restaurant_params
    params.require(:restaurant).permit(:name, :city_id, :location, :rate_for_two, :vegetarian_tag, :image)
  end
end
