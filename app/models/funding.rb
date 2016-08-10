class Funding < ActiveRecord::Base
	belongs_to :individual
	belongs_to :company
	belongs_to :user
	belongs_to :project

	def self.total_amount
		res = 0
		self.all.each do |fund|
			res+=fund.amount
		end
		return res
	end
end
