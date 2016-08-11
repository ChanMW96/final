class TransactionsController < ApplicationController

	def new
    @funding = Funding.find(params[:fund_id])
	  gon.client_token = generate_client_token
	end

	def create
    @funding = Funding.find(params[:funding_id])
    @project = @funding.project
    @result = Braintree::Transaction.sale(
              amount: @funding.amount,
              payment_method_nonce: params[:payment_method_nonce])
    if @result.success?
      @amount = @funding.amount
      @total = @project.total_amount + @amount
      @backers = @project.backers + 1
      @project.update_column(:total_amount, @total)
      @project.update_column(:backers, @backers)
      redirect_to project_path(@funding.project_id)
      flash[:success] = "Congratulations! Your transaction has been successfully!"
    else
      flash[:danger] = "Something went wrong while processing your transaction. Please try again!"
      Project.find(@funding.project_id).reset_amount
      gon.client_token = generate_client_token
      
    end
  end
	private
	def generate_client_token
	  Braintree::ClientToken.generate
	end

end
