class User < ActiveRecord::Base
	include Clearance::User

    attr_accessor :role_id

    after_save :add_role

    has_many :user_roles
    
	validates :password,presence: true,length:{
		       minimum: 5, maximum: 20}, 
		       :confirmation => true 
	validates :email,uniqueness: true
	validates :status,presence: true

	def self.user_role(role)
		case role
		when 'Superadmin'
			['Admin','User']
		when 'Admin'
			['User']
		when 'User'
			[]
		end
	end

	def self.auth_users(current_user)
		role = Role.find(current_user.user_roles[0].role_id).name
		user_role = user_role(role)
		user_ids = UserRole.where(role_id: Role.where(name: user_role).pluck(:id)).pluck(:user_id)
		User.where(id: user_ids)
	end
	 
	private
		def add_role
			UserRole.create!(user_id: self.id,role_id: self.role_id)
		end


end