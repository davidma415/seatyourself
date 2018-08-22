class ReservationsController < ApplicationController

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(
      date: params[:reservation][:date],
      time: params[:reservation][:time],
      party_size: params[:reservation][:party_size]
    )

    if @reservation.save
      session[:user_id] = @reservation.id
      redirect_to root_path
    else
      flash.now[:alert] = @reservation.errors.full_messages
      render :new
    end
  end

  def edit
    @reservation = User.find(params[:id])
  end

  def update
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
