# frozen_string_literal: true

class AccountTransaction < ApplicationRecord
  belongs_to :sender_account, class_name: 'Account', inverse_of: :outgoing_transactions
  belongs_to :receiver_account, class_name: 'Account', inverse_of: :incoming_transactions
end
