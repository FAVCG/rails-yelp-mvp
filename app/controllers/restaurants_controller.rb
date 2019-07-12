class RestaurantsController < ApplicationController
before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def show
    #@restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def edit
    #@restaurant = Restaurant.find(params[:id])
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    # new and create go together
    # if user saves the new restraunt without any error
    # redirects to the show page else it wont save becuase
    # theres an error
    if @restaurant.save
      redirect_to @restaurant
    else
      render 'new'
    end
  end

  def update
    # @restaurant = Restaurant.find(params[:id])
    # edit and update go together
    # if what user changed is good it will save and go back to show
    if @restaurant.update(restaurant_params)
      redirect_to restaurant_path(@restaurant)
    else
      render 'edit'
    end
  end

  # def destroy
  #   #@restaurant = Restaurant.find(params[:id])
  #   @restaurant.destroy

  #   redirect_to articles_path
  # end

  private

    def restaurant_params
      params.require(:restaurant).permit(:name, :address, :phone_number, :category)
    end

    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end
end
