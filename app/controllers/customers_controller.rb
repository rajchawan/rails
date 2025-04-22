class CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = current_customer
    @orders = @customer.orders.order(created_at: :desc)
                       .paginate(page: params[:page], per_page: 10)
  end

end