# frozen_string_literal: true

FactoryBot.define do
  factory :account_transaction do
    association :sender_account
    association :receiver_account

    amount { 10 }
    sender_account_balance { 100 }
    receiver_account_balance { 100 }
  end
end
