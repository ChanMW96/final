class Project < ActiveRecord::Base
	mount_uploaders :images, ProjectUploader
	acts_as_taggable
	searchkick
	belongs_to :individual
	belongs_to :company
	has_many :comments, foreign_key: :project_id
	has_many :fundings, foreign_key: :project_id
end
