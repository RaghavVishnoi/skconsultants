class ContactMailer < ApplicationMailer
	default from: "contact@skconsultants.in"


	def contacts(contact)
	    @subject = contact.subject
	    @name = contact.name
	    @email = contact.email
	    @contact = contact.contact_number
	    @message = contact.message
	    mail(to: 'raghavvishnoi10@gmail.com', subject: @subject)
	 end

end