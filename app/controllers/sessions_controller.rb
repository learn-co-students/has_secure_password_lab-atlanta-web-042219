class SessionsController < ApplicationController

  def new
  end

  def index
    render :homepage
  end

  def create
    # session[:name] = params[:name]
    # if !params[:name] || session[:name].empty?
    #   redirect_to login_path
    # elsif session[:name]
    #   redirect_to :homepage
    # end

    # @user = User.find_by(name: params[:name])
    # return head(:forbidden) unless @user.authenticate(params[:password])
    # session[:user_id] = @user.id

    user = User.find_by(name: params[:user][:name])
    user = user.try(:authenticate, params[:user][:password])
    return redirect_to(controller: 'sessions', action: 'new') unless user
    session[:user_id] = user.id
    @user = user
    redirect_to '/'
  end

  def destroy
    session.delete :name
  end

end