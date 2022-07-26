# frozen_string_literal: true

class Account < ApplicationRecord
  belongs_to :user

  has_many :outgoing_transactions, class_name: 'AccountTransaction',
                                   foreign_key: :sender_account_id,
                                   inverse_of: :sender_account,
                                   dependent: :delete_all

  has_many :incoming_transactions, class_name: 'AccountTransaction',
                                   foreign_key: :receiver_account_id,
                                   inverse_of: :receiver_account,
                                   dependent: :delete_all

  monetize :credit_cents
end
