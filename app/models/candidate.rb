class Candidate < ActiveRecord::Base

	mount_uploader :document, DocumentUploader

	has_many :documents,as: :resource,:dependent => :destroy

	after_create :add_resume
	after_create :notify_mail

	validates :first_name,presence: true
	validates :last_name,presence: true
	validates :email,presence: true
	validates :contact_number,presence: true
	validates :state,presence: true
	validates :city,presence: true
	validates :street,presence: true
	validates :qualification,presence: true
	validate  :document
	validates :experience,presence: true
	validates :job_title,presence: true


	private
		def add_resume
			@document = Document.new(document: self.document,resource_type: 'Candidate',resource_id: self.id)
	    	if @document.save!
	    		url = DocumentSerializer.new(@document, :root => false).document_url
	    		self.update(document: url) 
	    	else
	    	end
		end

		def notify_mail
			CandidateMailer.candidate_profile(self).deliver_now
		end


end
