class CurrentOpeningsController < ApplicationController

	PER_PAGE = 20

	layout 'admin'

	def index
		@current_openings  = CurrentOpening.all.paginate(per_page: PER_PAGE,:page => (params[:page] || 1))
	end

	def new
		@current_opening = CurrentOpening.new
	end

	def create
		@current_opening = CurrentOpening.new current_opening_params
		if @current_opening.save
			redirect_to current_openings_path
		else
			redirect_to @current_opening,alert: @current_opening.errors.full_messages.join(',')
		end
	end

	def edit
		@current_opening = CurrentOpening.find(params[:id])
	end

	 

	def update
		if @current_opening.update_attributes current_openings_path
			redirect_to current_openings_path
		else
			render @current_opening.errors.full_messages
		end
	end

	def jobs
		
	end

	def current_opening_params
		params.require(:current_opening).permit(:name,:exp_required,:from,:to,:status,:count_openings,:employer_industry, :job_description,{:functional_area => []},:candidate_skills,:annual_salary_offered,{:job_location => []},:candidate_industry,:current_location,:current_annual_salary,:minimum_exp,:maximum_exp,:qualification1,:highest_qualification,:company_name,:company_display_name,:company_description)
	end 

end