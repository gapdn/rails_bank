# frozen_string_literal: true

describe Accounts::CreateContract do
  subject(:contract) { described_class.new(account).call(params) }

  let(:user) { create(:user, :with_account) }
  let(:account) { Account.find_by(user_id: user.id) }
  let(:params) do
    attributes_for(:account).merge(user_id: account.user_id)
  end

  describe 'validations' do
    describe 'success' do
      context 'when record is valid' do
        its(:success?) { is_expected.to be true }
      end
    end

    describe 'failure' do
      context 'when user_id is empty' do
        before { params[:user_id] = '' }

        its(:success?) { is_expected.to be false }
      end

      context 'when credit is empty' do
        before { params[:credit] = '' }

        its(:success?) { is_expected.to be false }
      end

      context 'when number is empty' do
        before { params[:number] = '' }

        its(:success?) { is_expected.to be false }
      end

      context 'when credit_currency is' do
        context 'empty' do
          before { params[:credit_currency] = '' }

          its(:success?) { is_expected.to be false }
        end

        context 'invalid' do
          let(:error) { I18n.t('dry_validation.errors.account.rules.credit_currency.invalid') }
          let(:invalid_currency) { FFaker::BaconIpsum.word }

          before { params[:credit_currency] = invalid_currency }

          its('errors.messages.first.text') { is_expected.to eq(error) }
        end
      end
    end
  end
end
