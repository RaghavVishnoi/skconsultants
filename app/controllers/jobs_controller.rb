class JobsController < ApplicationController

	PER_PAGE = 20

	layout 'candidate'


	def index
		@jobs = CurrentOpening.where(status: 'Active').order('id desc').paginate(:per_page => PER_PAGE,:page => (params[:page] || 1))
	end

end