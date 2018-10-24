# frozen_string_literal: true

class MenuItemsController < ApplicationController
  before_action :set_menu_item, only: %i[show edit update destroy]
  load_and_authorize_resource :menu_item

  # GET /menu_items/new
  def new
    @menu_item = MenuItem.new
  end

  # GET /menu_items/1/edit
  def edit; end

  # POST /menu_items
  # POST /menu_items.json
  def create
    @menu_item = MenuItem.new(menu_item_params)
    @restaurant = Restaurant.find_by(user_id: current_user.id)
    @menu_item.restaurant_id = @restaurant.id
    respond_to do |format|
      if @menu_item.save
        format.html { redirect_to owners_restaurant_url(@restaurant), notice: 'Item was added to the menu.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /menu_items/1
  # PATCH/PUT /menu_items/1.json
  def update
    respond_to do |format|
      if @menu_item.update(menu_item_params)
        format.html { redirect_to @menu_item, notice: 'Item was updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /menu_items/1
  # DELETE /menu_items/1.json
  def destroy
    @menu_item.destroy
    respond_to do |format|
      format.html { redirect_to menu_items_url, notice: 'Menu item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_menu_item
    @menu_item = MenuItem.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def menu_item_params
    params.require(:menu_item).permit(:name, :amount, :restaurant_id)
  end
end
