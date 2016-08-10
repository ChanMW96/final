class ApplyMailer < ApplicationMailer
	def apply_email(email,msg)
		@email = email
		@msg = msg
		mail(to: @email, subject: 'Application')
	end
end