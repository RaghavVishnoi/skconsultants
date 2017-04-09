class ContactController < ApplicationController

	def index
	end

	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.new contact_params
		if @contact.save
			redirect_to '/contact',alert: "Successfully sent!"
		else
			render '/contact',alert:  @contact.errors.full_messages
		end
	end

	def contact_params
		params.require(:contact).permit(:name,:email,:contact_number,:subject,:message)
	end

end