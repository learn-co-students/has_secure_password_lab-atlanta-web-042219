class UsersController < ApplicationController

	def create
		@user = User.new(params.require(:user).permit(:name, :password, :password_confirmation))
		if @user.save
			session[:user_id] = @user.id
		else
			redirect_to new_user_path
		end
	end
end
