class Comment < ActiveRecord::Base
	belongs_to :individual
	belongs_to :company
	belongs_to :user
	belongs_to :project
end
