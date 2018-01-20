class SessionController < ApplicationController

	def new
		if signed_in?
			redirect_to '/admin'
		end
	end

	def create
		@session = authenticate(params)
		sign_in(@session) do |status|
			if status.success?	
				redirect_to '/admins'
			else
			 	redirect_to '/login',alert: 'wrong email or password combination!'
			end
		end
	end

	def destroy
		sign_out
		redirect_to '/login'
	end

	private
		  def user_params
		  	params.require(:session).permit(:email,:password)
		  end

end