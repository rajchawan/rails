class MenuItemsController <ApplicationController
  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @q = @restaurant.menu_items.ransack(params[:q])
    @menu_items = @q.result(distinct: true)
                  .paginate(page: params[:page], per_page: 10)
  
  end

  def show
    @menu_item = MenuItem.find(params[:id])
    @order = Order.new
  end

end