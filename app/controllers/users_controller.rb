class UsersController < ApplicationController
  before_action :user_session, only: [:edit, :show, :update]
  def new
    @user = User.new
  end

  def create
    @user = User.new(
      username: params[:user][:username],
      first_name: params[:user][:first_name],
      last_name: params[:user][:last_name],
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
  #
  def edit
  end

  def show
  end

  def update
    @user.first_name = params[:user][:first_name]
    @user.last_name = params[:user][:last_name]
    @user.username = params[:user][:username]
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]

    if @user.save
      redirect_to user_path
    else
      render :edit
    end
  end

  def user_session
    @user = User.find(session[:user_id])
  end
end
