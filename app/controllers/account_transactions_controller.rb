# frozen_string_literal: true

class AccountTransactionsController < ApplicationController
  def index
    @outgoing_transactions = current_user.outgoing_transactions
    @incoming_transactions = current_user.incoming_transactions
    @account_id = params[:account_id]
  end

  def show
    @account_transaction = AccountTransaction.find(params[:id])
  end

  def new
    @account_transaction = AccountTransaction.new
    @presenter = AccountTransactions::CreatePresenter.new(current_user:)
    @account_id = params[:account_id]
  end

  def create
    result = AccountTransactions::Creator.call(account_transaction_params)
    app_render(result, redirect_url: account_transaction_url(result), return_action: :new)
  end

  private

  def account_transaction_params
    params.require(:account_transaction).permit(
      :sender_account_id,
      :receiver_account_id,
      :sender_account_balance,
      :receiver_account_balance,
      :amount
    )
  end
end
