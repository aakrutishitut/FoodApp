# inherits from application controller
class MenuItemsController < ApplicationController
  before_action :set_menu_item, only: %i[show edit update destroy]
  load_and_authorize_resource :menu_item

  # GET /menu_items
  # GET /menu_items.json
  def index
    @menu_items = MenuItem.where(restaurant_id: params[:restaurant])
  end

  # GET /menu_items/1
  # GET /menu_items/1.json
  def show; end

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
    @menu_item.restaurant_id = Restaurant.find_by_user_id(current_user.id).id
    respond_to do |format|
      if @menu_item.save
        format.html { redirect_to controller: 'restaurants', action: 'index' }
        format.json { render :show, status: :created, location: @menu_item }
      else
        format.html { render :new }
        format.json { render json: @menu_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menu_items/1
  # PATCH/PUT /menu_items/1.json
  def update
    # @menu_item.restaurant_id=Restaurant.find_by_user_id(current_user.id).id
    respond_to do |format|
      if @menu_item.update(menu_item_params)
        format.html { redirect_to controller: 'restaurants', action: 'index' }
        format.json { render :show, status: :ok, location: @menu_item }
      else
        format.html { render :edit }
        format.json { render json: @menu_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menu_items/1
  # DELETE /menu_items/1.json
  def destroy
    @menu_item.destroy
    respond_to do |format|
      format.html { redirect_to controller: 'restaurants', action: 'index' }
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
    params.require(:menu_item).permit(:name, :amount)
  end
end
