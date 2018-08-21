class UserController < ApplicationController

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
  end

  def update
  end

end
