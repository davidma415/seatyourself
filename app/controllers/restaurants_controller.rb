class RestaurantsController < ApplicationController

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(
      name: params[:restaurant][:name],
      opening_hour: params[:restaurant][:opening_hour],
      closing_hour: params[:restaurant][:closing_hour],
      max_capacity: params[:restaurant][:max_capacity]
    )

    if @restaurant.save
      session[:user_id] = @restaurant.id
      redirect_to root_path
    else
      flash.now[:alert] = @restaurant.errors.full_messages
      render :new
    end
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


end
