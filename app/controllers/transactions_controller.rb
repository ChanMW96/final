class TransactionsController < ApplicationController

	def new
    @funding = Funding.find(params[:fund_id])
	  gon.client_token = generate_client_token
	end

	def create
    @funding = Funding.find(params[:funding_id])
    @result = Braintree::Transaction.sale(
              amount: @funding.amount,
              payment_method_nonce: params[:payment_method_nonce])
    if @result.success?
      redirect_to project_path(@funding.project_id), notice: "Congraulations! Your transaction has been successfully!"
    else
      flash[:alert] = "Something went wrong while processing your transaction. Please try again!"
      gon.client_token = generate_client_token
      
    end
  end
	private
	def generate_client_token
	  Braintree::ClientToken.generate
	end

end
