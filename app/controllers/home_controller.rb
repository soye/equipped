class HomeController < ApplicationController
	def index
	end

	def login
	end

	def logout
		reset_session
		flash[:notice] = "You just signed out. Come back soon!"
		redirect_to home_login_path
	end

	def post_login
		@user = User.find_by(email: params[:email])
		if @user != nil then
			reset_session
			session[:user_id] = @user.id.to_s
			session[:user_first_name] = @user.first_name
			session[:user_last_name] = @user.last_name
			redirect_to home_index_path
		else
			flash[:notice] = "Sorry, the user \"" + params[:email] + "\" does not exist. Try again?"
			redirect_to home_login_path
		end
	end
end
