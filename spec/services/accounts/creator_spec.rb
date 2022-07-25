# frozen_string_literal: true

describe Accounts::Creator do
  describe '.call' do
    subject(:creator) { -> { described_class.call(params) } }

    let(:user) { create(:user) }
    let(:params) { attributes_for(:account).merge(user_id: user.id).symbolize_keys }

    it { is_expected.to change(Account, :count).by(1) }

    context 'when account is invalid' do
      before { params.merge!(credit_currency: nil) }

      it { is_expected.not_to change(Account, :count) }
    end
  end
end
