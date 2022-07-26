# frozen_string_literal: true

FactoryBot.define do
  factory :account do
    association :user

    number { FFaker::Number.number(digits: 16).to_s }
    credit { 100 }
    credit_currency { :usd }
  end
end
