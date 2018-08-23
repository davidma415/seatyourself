class ReservationsController < ApplicationController
  before_action :ensure_logged_in, only: [:new, :create, :edit, :update]
  def new
    @reservation = Reservation.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = Reservation.new(
      date: params[:reservation][:date],
      time: params[:reservation][:time],
      party_size: params[:reservation][:party_size],
      user_id: current_user.id,
      restaurant: @restaurant
    )

    if @reservation.save
      flash[:notice] = "Your reservation at #{@restaurant.name} has been made for #{@reservation.date} at #{@reservation.time.strftime("%I:%M%p")} for #{@reservation.party_size}."
      redirect_to root_path
    else
      render :new
    end
  end

  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservations = Reservation.where(restaurant_id: @restaurant.id)
  end

  def edit
    @reservation = User.find(params[:id])
  end

  def update
    flash[:notice] = "Your reservation at #{@restaurant.name} has been changed and is now on #{@reservation.date} at #{@reservation.time.strftime("%I:%M%p")} for #{@reservation.party_size}."
    @reservation = Reservation.find(params[:id])
    @reservation.date = params[:reservation][:date]
    @reservation.time = params[:reservation][:time]
    @reservation.party_size = params[:reservation][:party_size]

    if @reservation.save
      redirect_to user_path
    else
      render :edit
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    flash[:notice] = "You've successfully deleted a reservation."
    redirect_to user_path
  end

end
