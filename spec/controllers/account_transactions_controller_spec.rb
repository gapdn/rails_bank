# frozen_string_literal: true

describe AccountTransactionsController, type: :controller do
  let!(:user) { create(:user, :with_account) }
  let!(:user_2) { create(:user, :with_account) }
  let(:transaction) do
    create(
      :account_transaction,
      sender_account_id: user.accounts.first.id,
      receiver_account_id: user_2.accounts.first.id,
      amount: FFaker::Number.number
    )
  end

  describe 'GET /account_transactions' do
    before do
      transaction
      sign_in(user)
      get :index
    end

    it 'success' do
      expect(response).to be_successful
    end

    it 'renders correct template' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET show /account_transactions/:id' do
    before do
      sign_in(user)
      get(:show, params: { id: transaction.id })
    end

    it 'success' do
      expect(response).to be_successful
    end

    it 'renders correct template' do
      expect(response).to render_template(:show)
    end
  end

  describe 'POST /accounts' do
    before do
      sign_in(user)
      post(:create, params:)
    end

    describe 'success' do
      let(:transaction_id) { AccountTransaction.last.id }
      let(:params) { { account_transaction: transaction.attributes } }

      it 'returns 302' do
        expect(response.status).to eq 302
      end

      it 'redirect to account_transactions view' do
        expect(response).to redirect_to(account_transaction_url(transaction_id))
      end
    end

    describe 'failure' do
      let(:params) do
        {
          account_transaction: transaction.attributes.merge(amount: 'error')
        }
      end

      it 'returns 422' do
        expect(response.status).to eq 422
      end

      it 'renders correct template' do
        expect(response).to render_template(:new)
      end
    end
  end
end
