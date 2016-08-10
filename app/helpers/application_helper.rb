module ApplicationHelper
	def current_consumer
		if session[:user_id]
			case session[:type]
			when 1
				@current_consumer ||=Individual.find_by_id(session[:user_id])
			when 2
				@current_consumer ||=Company.find_by_id(session[:user_id])
			end
		end
	end

	def logged_in?
		!current_user.nil?
	end
end
