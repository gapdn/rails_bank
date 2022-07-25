# frozen_string_literal: true

module Accounts
  class CreateContract < ApplicationContract
    CURRENCIES = Money::Currency.table.keys

    params do
      required(:user_id).filled(:integer)
      required(:credit_currency).filled(:symbol)
      required(:number).filled(:string)
      required(:credit).filled(:integer)
    end

    rule(:credit_currency) do
      unless CURRENCIES.include?(value)
        key.failure(I18n.t('dry_validation.errors.account.rules.credit_currency.invalid'))
      end
    end
  end
end
