class RestaurantController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(
      username: params[:user][:username],
      name: params[:user][:name],
      email: params[:user][:email],
      password: params[:user][:password],
      password_confirmation: params[:user][:password_confirmation]
    )

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash.now[:alert] = @user.errors.full_messages
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.first_name = params[:user][:first_name]
    @user.last_name = params[:user][:last_name]
    @user.email = params[:user][:email]
    @user.password_digest = params[:user][:password_digest]

    if @user.save
      redirect_to user_path
    else
      render :edit


  end


end
