class RestaurantsController < ApplicationController


  def index
    @q = Restaurant.ransack(params[:q])
    @restaurants = @q.result(distinct: true)
                  .paginate(page: params[:page], per_page: 10)
  
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @menu_items = @restaurant.menu_items
  end

end