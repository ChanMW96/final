class Stranger < ActiveRecord::Base
  has_many :fundings, foreign_key: :user_id
	has_many :projects, foreign_key: :user_id
	has_many :comments, foreign_key: :user_id
end
