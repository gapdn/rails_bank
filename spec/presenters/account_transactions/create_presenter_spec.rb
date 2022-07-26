# frozen_string_literal: true

describe AccountTransactions::CreatePresenter do
  subject(:presenter) { described_class.new(current_user:) }

  let!(:current_user) { create(:user, :with_account) }
  let!(:another_user) { create(:user, :with_account) }

  describe '#accounts' do
    it 'returns account numbers and ids' do
      expect(presenter.accounts).to eq [another_user.accounts.pluck(:number, :id).flatten]
    end
  end
end
