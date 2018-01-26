class Role < ActiveRecord::Base
 
 	belongs_to :user_roles
 	
 	validates :name,presence: true
 
 end 