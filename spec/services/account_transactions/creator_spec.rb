# frozen_string_literal: true

describe AccountTransactions::Creator do
  describe '.call' do
    subject(:creator) { -> { described_class.call(params) } }

    let(:user) { create(:user) }
    let(:sender_account) { create(:account, user:) }
    let(:receiver_account) { create(:account, user:) }
    let(:params) do
      attributes_for(:account_transaction).merge(
        sender_account_id: sender_account.id,
        receiver_account_id: receiver_account.id
      ).symbolize_keys
    end

    it { is_expected.to change(AccountTransaction, :count).by(1) }

    context 'when AccountTransactions is invalid' do
      before { params.merge!(amount: 'error') }

      it { is_expected.not_to change(AccountTransaction, :count) }
    end
  end
end
