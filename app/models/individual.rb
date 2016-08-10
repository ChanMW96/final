class Individual < ActiveRecord::Base
	mount_uploaders :images, IndividualUploader
  	has_secure_password
 	has_many :fundings, foreign_key: :user_id
	has_many :projects, foreign_key: :user_id
	has_many :comments, foreign_key: :user_id
end
