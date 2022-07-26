# frozen_string_literal: true

describe AccountsController, type: :controller do
  let!(:user) { create(:user, :with_account) }

  describe 'GET /accounts' do
    before do
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

  describe 'GET show /accounts/:id' do
    before do
      sign_in(user)
      get(:show, params: { id: user.accounts.first.id })
    end

    it 'success' do
      expect(response).to be_successful
    end

    it 'renders correct template' do
      expect(response).to render_template(:show)
    end
  end

  describe 'GET edit /accounts/:id' do
    before do
      sign_in(user)
      get(:new)
    end

    it 'success' do
      expect(response).to be_successful
    end

    it 'renders correct template' do
      expect(response).to render_template(:new)
    end
  end

  describe 'POST /accounts' do
    let(:account_id) { Account.last.id }

    before do
      sign_in(user)
      post(:create, params:)
    end

    describe 'success' do
      let(:params) { { account: { user_id: user.id, credit_currency: 'UAH' } } }

      it 'returns 302' do
        expect(response.status).to eq 302
      end

      it 'redirect to account view' do
        expect(response).to redirect_to(account_url(account_id))
      end
    end

    describe 'failure' do
      let(:params) { { account: { user_id: user.id, credit_currency: '' } } }

      it 'returns 422' do
        expect(response.status).to eq 422
      end

      it 'renders correct template' do
        expect(response).to render_template(:new)
      end
    end
  end
end
