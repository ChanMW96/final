class Company < ActiveRecord::Base
	mount_uploaders :images, CompanyUploader
	has_secure_password
	has_many :fundings, foreign_key: :user_id
	has_many :projects, foreign_key: :user_id
	has_many :comments, foreign_key: :user_id
end
