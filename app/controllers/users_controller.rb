class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params(params[:user]))

		if @user.save then
			flash[:notice] = "Thanks for registering, #{@user.first_name}. Log in now!"
			redirect_to home_login_path
		else
			render new_user_path
		end
	end
	
	private
		def user_params(params)
			return params.permit(:first_name, :last_name, :email)
		end
end