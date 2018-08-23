class RestaurantsController < ApplicationController
  before_action :ensure_logged_in, only: [:new, :create]
  before_action :verify_owner_of_restaurant, only: [:edit, :update]
  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(
      name: params[:restaurant][:name],
      opening_hour: params[:restaurant][:opening_hour],
      closing_hour: params[:restaurant][:closing_hour],
      max_capacity: params[:restaurant][:max_capacity],
      max_party_size: params[:restaurant][:max_party_size],
      min_party_size: params[:restaurant][:min_party_size],
      user_id: current_user.id
    )

    if @restaurant.save
      redirect_to root_path
    else
      flash.now[:alert] = @restaurant.errors.full_messages
      render :new
    end
  end

  def index
    @restaurant = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.name = params[:restaurant][:name]
    @restaurant.opening_hour = params[:restaurant][:opening_hour]
    @restaurant.closing_hour = params[:restaurant][:closing_hour]
    @restaurant.max_capacity = params[:restaurant][:max_capacity]

    if @restaurant.save
      redirect_to restaurant_path
    else
      render :edit
    end
  end

  def verify_owner_of_restaurant
    @restaurant = Restaurant.find(params[:id])
    unless current_user.id == @restaurant.user_id
      flash[:notice] = "You do not own this restaurant. Please login as the owner."
      redirect_to new_session_url
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    flash[:notice] = "You have successfully deleted your restaurant."
    redirect_to restaurants_path
  end
end
