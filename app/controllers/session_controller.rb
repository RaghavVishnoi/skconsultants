class SessionController < ApplicationController
 
 	def new
 		if signed_in?
 			redirect_to users_path
 		end
 	end
 
 	def create
 		@session = authenticate(params)
 		sign_in(@session) do |status|
 			if status.success?	
 				redirect_to current_openings_path
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