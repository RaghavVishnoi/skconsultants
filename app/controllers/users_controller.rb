class UsersController < ApplicationController

	layout 'admin'

	def index
		@users = User.auth_users(current_user)
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new user_params
		if @user.save
			redirect_to users_path
		else
			redirect_to new_user_path, alert: @user.errors.full_messages
		end				
	end

	def user_params
		params.require(:user).permit(:email,:name,:role_id,:status,:password,:password_confirmation)
	end

end
