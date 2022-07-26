# frozen_string_literal: true

describe AccountTransactions::CreateMapper do
  subject(:mapper) { described_class.new.call(params) }

  let(:user) { create(:user) }
  let(:sender_account) { create(:account, user:) }
  let(:receiver_account) { create(:account, user:) }
  let(:params) do
    attributes_for(:account_transaction).merge(
      sender_account_id: sender_account.id,
      receiver_account_id: receiver_account.id
    )
  end
  let!(:sender_final_balance) { params[:sender_account_balance] - params[:amount] }
  let!(:receiver_final_balance) { params[:receiver_account_balance] + params[:amount] }

  it 'transforms params' do
    expect(mapper[:sender_account_balance]).to eq sender_final_balance
    expect(mapper[:receiver_account_balance]).to eq receiver_final_balance
  end
end
