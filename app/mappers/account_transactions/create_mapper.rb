# frozen_string_literal: true

module AccountTransactions
  class CreateMapper < ApplicationMapper
    def call(input)
      sender_balance(input)
      receiver_balance(input)

      super(input)
    end

    private

    def sender_balance(input)
      result = get_balance(input[:sender_account_id]) - input[:amount].to_i
      input.merge!(sender_account_balance: result)
    end

    def receiver_balance(input)
      result = get_balance(input[:receiver_account_id]) + input[:amount].to_i
      input.merge!(receiver_account_balance: result)
    end

    def get_balance(account_id)
      Account.find(account_id).credit.amount.to_i
    end
  end
end
