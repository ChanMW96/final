class ApplyMailer < ApplicationMailer
	def apply_email(user,msg)
		@user = user
		@msg = msg
		mail(to: @user.email, subject: 'Application')
	end
end