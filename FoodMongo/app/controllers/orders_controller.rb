# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :set_order, only: %i[show edit update destroy]
  load_and_authorize_resource :order

  # GET /orders
  # GET /orders.json
  def index
    if current_user.type_of_u == 'restaurant'
      @rest = Restaurant.find_by(user_id: current_user.id)
      @orders = Order.where(restaurant_id: @rest.id.to_s).paginate(page: params[:page], per_page: 5)
    else
      @orders = Order.where(user_id: current_user.id).paginate(page: params[:page], per_page: 5)
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show; end

  # GET /orders/new
  def new
    @items = Cart.where(restaurant_id: params[:restaurant_id])
    @total = Cart.where(restaurant_id: params[:restaurant_id]).sum(:amount)
    # redirect_to users_url if @total.zero?
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
        @current_items = Cart.all
        @current_items.each do |current_item|
          @item = Item.new
          @item.name = current_item.name
          @item.quantity = current_item.quantity
          @item.amount = current_item.amount
          @item.order_id = @order.id
          @item.save
          UserMailer.order_confirmation(current_user.email).deliver_later
        end
        Cart.destroy_all
        args = @order.to_json
        HardWorker.perform_in(1.minutes, args)
        format.html { redirect_to restaurants_url, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html {}
        format.js {}
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def send_order_history
    if current_user.type_of_u == 'restaurant'
      @rest = Restaurant.find_by(user_id: current_user.id)
      @orders = Order.where(restaurant_id: @rest.id.to_s)
    else
      @orders = Order.where(user_id: current_user.id)
    end
    Spreadsheet.client_encoding = 'UTF-8'
    book = Spreadsheet::Workbook.new
    sheet1 = book.create_worksheet name: current_user.name
    i = 0
    @orders.each do |order|
      sheet1.row(i).push order.id, order.status, order.total
      i += 1
    end
    book.write 'order_history.xls'
    UserMailer.order_history(current_user.email).deliver_later
    redirect_to orders_url
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
