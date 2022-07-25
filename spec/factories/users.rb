# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    email { FFaker::Internet.safe_email }
    password { FFaker::Internet.password }

    trait :with_account do
      after(:create) do |user|
        create(:account, user:)
      end
    end
  end
end
