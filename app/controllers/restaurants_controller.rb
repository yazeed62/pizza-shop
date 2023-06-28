class RestaurantsController < ApplicationController
  def index
    restaurants = Restaurant.all
    render json: restaurants
  end

  def show
    restaurant = Restaurant.find_by(id: params[:id])
    if restaurant
      render json: restaurant.as_json(include: :pizzas)
    else
      render json: { error: "Restaurant not found" }, status: :not_found
    end
  end

  def destroy
    restaurant = Restaurant.find_by(id: params[:id])
    if restaurant
       restaurant.pizzas.destroy_all
      restaurant.destroy
      head :no_content
    else
      render_not_found_response
    end
  end

  private

  def find_restaurant
    Restaurant.find(params[:id])
  end

  def restaurant_params
    params.permit(:name, :address)
  end

  def render_not_found_response
    render json: { error: "Restaurant not found" }, status: :not_found
  end
end
