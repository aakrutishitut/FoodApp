# inherits from application controller
class OrdersController < ApplicationController
  before_action :set_order, only: %i[show edit update destroy]
  load_and_authorize_resource :order
  respond_to :html, :js, :json
  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.where(user_id: current_user.id)
  end

  # GET /orders/1
  # GET /orders/1.json
  def show; end

  # GET /orders/new
  def new
    @items = Current.where(restaurant_id: session[:restaurant_id])
    @total = Current.where(restaurant_id: session[:restaurant_id]).sum(:amount)
    redirect_to users_url if @total.zero?
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit; end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    respond_to do |format|
      if @order.save
        @current_items = Current.all
        @current_items.each do |current_item|
          @item = Item.new
          @item.name = current_item.name
          @item.quantity = current_item.quantity
          @item.amount = current_item.amount
          @item.menu_item_id = current_item.menu_item_id
          @item.order_id = @order.id
          @item.save
        end
        Current.destroy_all
        args = @order.to_json
        HardWorker.perform_in(1.minutes, args)
        format.html { redirect_to users_url, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html {}
        format.js {}
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # def display
  #   respond_to do |format|
  #     format.html {}
  #     format.js {}
  #   end
  # end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def order_params
    params.require(:order).permit(:status, :payment_mode, :total, :user_id, :order_time, :restaurant_id)
  end
end
