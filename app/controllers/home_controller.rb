class HomeController < ApplicationController

	def index
		@current_openings = CurrentOpening.where(status: 'Active')
	end

end
