# frozen_string_literal: true

module Accounts
  class CreateMapper < ApplicationMapper
    DEFAULT_CREDIT_AMOUNT = 100
    NUMBER_RANGE = (1..16)

    def call(input)
      default_credit(input)
      normalize_currency(input)
      account_number(input)

      super(input)
    end

    private

    def default_credit(input)
      input.merge!(credit: DEFAULT_CREDIT_AMOUNT)
    end

    def normalize_currency(input)
      return if input[:credit_currency].blank?

      input.merge!(credit_currency: input[:credit_currency].downcase.to_sym)
    end

    def account_number(input)
      input.merge!(number: NUMBER_RANGE.map { rand(0..9) }.join)
    end
  end
end
