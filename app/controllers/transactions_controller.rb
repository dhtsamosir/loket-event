class TransactionsController < ApplicationController
  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.save
    render json: @transaction, status: 200
  end

  private

  def transaction_params
    params.require(:transaction).permit(:customer_id,  { tickets: [:ticket_id, :amount]})
  end
end