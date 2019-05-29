class UsersController < ApplicationController
  # before_action :require_login

  def new
    # @user = User.new
  end

  def create
    # @user = User.new(user_params)
    # if @user.save
    #   redirect_to user_path(@user)
    # else
    #   render :new
    # end

    @user = User.create(user_params)
    return redirect_to controller: 'users', action: 'new' unless @user.save
    session[:user_id] = @user.id
    redirect_to controller: 'sessions', action: 'index'
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end


  private
 
  # def require_login
  #   return head(:forbidden) unless session.include? :user
  # end

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
