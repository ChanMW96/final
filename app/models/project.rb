class Project < ActiveRecord::Base
	mount_uploaders :images, ProjectUploader
	acts_as_taggable
	searchkick
	belongs_to :individual
	belongs_to :company
	has_many :comments, foreign_key: :project_id
	has_many :fundings, foreign_key: :project_id
	after_save :reset_amount
	def reset_amount
		res = 0
		self.fundings.each do |fund|
			res+=fund.amount
		end
		self.total_amount = res
	end
end
