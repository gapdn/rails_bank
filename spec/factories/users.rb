# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    full_name { FFaker::NameMX.full_name }
    email { FFaker::Internet.safe_email }
    password { FFaker::Internet.password }
  end
end
