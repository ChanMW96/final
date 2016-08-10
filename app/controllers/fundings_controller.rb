class FundingsController < ApplicationController
  def create
  	if funding_params[:user_id].nil?
  		@user = Stranger.create(funding_params[:email])
  	elsif session[:type].nil?
  		@user = Stranger.find(funding_params[:user_id])
  	elsif session[:type] == 1
  		@user = Individual.find(funding_params[:user_id])
  	elsif session[:type] == 2
  		@user = Company.find(funding_params[:user_id])
  	end
  	hash = funding_params.delete_if {|key,value| key=='email'}
    @funding = Funding.create(hash)
    redirect_to "/transactions/new?fund_id=#{@funding.id}"
  end

  def funding_params
  	params.require(:fund).permit(:email,:amount,:user_id,:user_type,:project_id)
  end
end
