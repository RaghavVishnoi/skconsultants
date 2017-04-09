class Contact < ActiveRecord::Base

  after_create :notify_mail

  validates :name, presence: true
  validates :email, presence: true
  validates :contact_number, presence: true
  validates :subject, presence: true
  validates :message, presence: true


private
    def notify_mail
    	puts "ininin"
		ContactMailer.contacts(self).deliver_now
	end

end
