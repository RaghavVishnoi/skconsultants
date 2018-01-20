class ApplicationController < ActionController::Base
	include Clearance::Controller
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  after_filter :set_header_for_iframe
  before_filter :set_current_user

  private 
  	def set_header_for_iframe 
  		response.headers.delete "X-Frame-Options" 
  	end 

  	def set_current_user

  	end

end
