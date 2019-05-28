class UsersController < ApplicationController

    def new
        User.new
    end

    def create
        @user = User.create(user_params)
        session[:user_id] = @user.id
        redirect_to new_users_path
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
