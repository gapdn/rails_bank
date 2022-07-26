# frozen_string_literal: true

module AccountTransactions
  class Creator < CrudService
    def run
      safe_create(contract.to_h)
    end

    def contract
      @contract ||= AccountTransactions::CreateContract.new.call(params)
    end

    def mapper
      AccountTransactions::CreateMapper.new.call(params)
    end

    private

    def safe_create(params)
      ActiveRecord::Base.transaction do
        @trasnsaction = AccountTransaction.new(transaction_params)
        @trasnsaction.save!

        @trasnsaction.sender_account.update!(credit: params[:sender_account_balance])
        @trasnsaction.receiver_account.update!(credit: params[:receiver_account_balance])
      end

      @trasnsaction
    end

    def transaction_params
      {
        sender_account_id: params[:sender_account_id],
        receiver_account_id: params[:receiver_account_id],
        sender_account_balance: params[:sender_account_balance],
        receiver_account_balance: params[:receiver_account_balance],
        amount: params[:amount]
      }
    end
  end
end
