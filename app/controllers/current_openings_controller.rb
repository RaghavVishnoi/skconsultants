class CurrentOpeningsController < ApplicationController

	PER_PAGE = 20

	layout 'admin',only: [:index,:new,:edit,:show]

	def index
		@current_openings  = CurrentOpening.all.paginate(per_page: PER_PAGE,:page => (params[:page] || 1))
	end

	def candidate_list
		@current_openings  = CurrentOpening.where(status: 'Active').paginate(per_page: PER_PAGE,:page => (params[:page] || 1))
	end

	def new
		@current_opening = CurrentOpening.new
	end

	def show
		@current_opening = CurrentOpening.find(params[:id])
	end

	def candidate_show
		@current_opening = CurrentOpening.find(params[:id])
	end

	def create
		@current_opening = CurrentOpening.new current_opening_params
		if @current_opening.save!
			redirect_to current_openings_path
		else
			redirect_to @current_opening,alert: @current_opening.errors.full_messages.join(',')
		end
	end

	def edit
		@current_opening = CurrentOpening.find(params[:id])
	end

	 

	def update
		@current_opening = CurrentOpening.find(params[:id])
		if @current_opening.update_attributes(current_opening_params)
			redirect_to current_openings_path
		else
			render @current_opening.errors.full_messages
		end
	end

	def jobs
		
	end

	def current_opening_params
		params.require(:current_opening).permit(:name,:exp_required,:from,:to,:status,:count_openings,:employer_industry, :job_description,{:functional_area => []},:candidate_skills,:annual_salary_offered,:job_location,:candidate_industry,:current_location,:current_annual_salary,:minimum_exp,:maximum_exp,:qualification1,:highest_qualification,:company_name,:company_display_name,:company_description)
	end 

end