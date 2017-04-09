class CandidateMailer < ApplicationMailer
	default from: "resume@skconsultants.in"

	def candidate_profile(candidate)
	    @candidate = candidate
	    attachments['resume_'+@candidate.id.to_s] = File.read(File.join(Rails.root,'public',@candidate.document.to_s))
	    mail(to: 'skconsultants@outlook.com', subject: 'Application for job')
	 end
end
