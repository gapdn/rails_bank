# frozen_string_literal: true

module AccountTransactions
  class CreateContract < ApplicationContract
    params do
      required(:sender_account_id).filled(:integer)
      required(:receiver_account_id).filled(:integer)
      required(:sender_account_balance).filled(:integer)
      required(:receiver_account_balance).filled(:integer)
      required(:amount).filled(:integer)
    end

    rule(:sender_account_balance) do
      unless can_send?(value)
        key.failure(I18n.t('dry_validation.errors.account_transaction.rules.sender_account.invalid'))
      end
    end

    rule(:receiver_account_id) do
      unless valid_receiver?(values.data[:sender_account_id], values.data[:receiver_account_id])
        key.failure(I18n.t('dry_validation.errors.account_transaction.rules.receiver_account.invalid'))
      end
    end

    rule(:amount) do
      key.failure(I18n.t('dry_validation.errors.account_transaction.rules.amount.invalid')) if value <= 0
    end

    private

    def can_send?(sender_account_balance)
      return true if sender_account_balance >= 0
    end

    def valid_receiver?(sender_account_id, receiver_account_id)
      return true if sender_account_id != receiver_account_id
    end
  end
end
