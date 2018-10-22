class CartsController < ApplicationController
  load_and_authorize_resource :cart
  before_action :set_cart, only: %i[update destroy]
  # GET /carts
  # GET /carts.json
  
  # GET /carts/new
  def new
    @cart = Cart.new
  end

 
  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new(cart_params)
    tem=@cart.amount* @cart.quantity
    @cart.amount=tem
    @restaurant=Restaurant.find_by(id: @cart.restaurant_id)
    respond_to do |format|
      if @cart.save
        format.html { redirect_to restaurant_url(@restaurant), notice: 'Item added to the cart.' }
      else
        format.html { render :new }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart.destroy
    @restaurant=Restaurant.find_by(id: @cart.restaurant_id)
    respond_to do |format|
      format.html { redirect_to new_order_url(@restaurant), notice: 'Item was succesfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.require(:cart).permit(:name,:amount,:quantity,:restaurant_id,:user_id)
    end
end
