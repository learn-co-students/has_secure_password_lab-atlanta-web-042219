class UsersController < ApplicationController
  before_action :require_login, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(name: params[:user][:name], password: params[:user][:password], password_confirmation: params[:user][:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def require_login
    redirect_to login_path unless session[:user_id]
  end
end
