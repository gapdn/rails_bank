# frozen_string_literal: true

describe AccountsController, type: :controller do
  describe 'GET /accounts' do
    let!(:user) { create(:user, :with_account) }

    before do
      sign_in(user)
      get :index
    end

    it 'contains account numbers' do
      expect(response).to be_successful
      expect(response.body).to include(user.accounts.map(&:number))
    end
  end
end
