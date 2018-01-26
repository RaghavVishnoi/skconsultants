class CurrentOpening < ActiveRecord::Base

	after_save :default_values

	validates :name, presence: true
	validates :exp_required, presence: true
	validates :from, presence: true
	validates_format_of :from, :with => /\d{4}\-\d{2}\-\d{2}/, :message => "Date must be in the following format: yyyy/mm/dd"
	validates :to, presence: true
	validates :status, presence: true
	validates :job_description,presence: true
	validate :functional_area 
	validates :annual_salary_offered,presence: true
	validates :job_location,presence: true
	validate  :candidate_industry
	validate  :current_location
	validate  :current_annual_salary
	validate  :minimum_exp
	validate  :maximum_exp
	validate  :qualification1
	validate  :highest_qualification
	validates :company_name,presence: true
	validates :company_display_name,presence: true
	validate  :company_description
	validate  :candidate_skills

	private
		def default_values
			self.status ||= 'Active'
		end

end