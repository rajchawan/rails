class OrdersController < ApplicationController
  def create
    @menu_item = MenuItem.find(params[:menu_item_id])
    @Order
    @order = current_customer.orders.new(order_params)  # Use current_customer
    @order.customer = current_customer
    @order.restaurant = @menu_item.restaurant
    @order.item_name = @menu_item.item_name
    @order.price = @menu_item.price 
  
    if @order.save
      redirect_to orders_path, notice: 'Order placed successfully!'
    else
      flash[:alert] = @order.errors.full_messages.join(', ')
      redirect_to menu_item_path(@menu_item)
    end
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = current_customer.orders.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:quantity, :schedule_time)
  end
end