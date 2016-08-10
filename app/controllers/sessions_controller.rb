class SessionsController < ApplicationController
  def new
  end

  def create
  	temp = params[:session]
		@individual = Individual.find_by(email:temp['email'])
    @company = Company.find_by(email:temp['email'])
    if !@individual.nil?
      session[:user_id] = @individual.id
      session[:type] = 1
      redirect_to root_path
    elsif !@company.nil?
      session[:user_id] = @company.id
      session[:type] = 2
    else
      redirect_to new_sessions_path
    end
  
  end

  def destroy
  	session.delete(:user_id)
  	redirect_to root_path
  end
end
