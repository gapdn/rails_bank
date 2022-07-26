# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable

  has_many :accounts, dependent: :delete_all
  has_many :outgoing_transactions, class_name: 'AccountTransaction',
                                   foreign_key: :sender_account_id,
                                   inverse_of: :sender_account,
                                   dependent: :destroy

  has_many :incoming_transactions, class_name: 'AccountTransaction',
                                   foreign_key: :receiver_account_id,
                                   inverse_of: :receiver_account,
                                   dependent: :destroy
end
