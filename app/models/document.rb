class Document < ActiveRecord::Base

	mount_uploader :document, DocumentUploader

	belongs_to :candidate

	validates :document, presence: true
	validates :resource_type, presence: true
	validates :resource_id, presence: true

end