# frozen_string_literal: true

describe AccountTransaction do
  describe 'columns' do
    it { is_expected.to have_db_column(:sender_account_balance) }
    it { is_expected.to have_db_column(:receiver_account_balance) }
    it { is_expected.to have_db_column(:amount) }
  end

  describe 'relations' do
    it { is_expected.to belong_to(:sender_account).class_name('Account') }
    it { is_expected.to belong_to(:receiver_account).class_name('Account') }
  end
end
