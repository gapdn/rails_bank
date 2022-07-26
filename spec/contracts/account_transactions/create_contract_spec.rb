# frozen_string_literal: true

describe AccountTransactions::CreateContract do
  subject(:contract) { described_class.new.call(params) }

  let(:user) { create(:user) }
  let(:sender_account) { create(:account, user:) }
  let(:receiver_account) { create(:account, user:) }
  let(:params) do
    attributes_for(:account_transaction).merge(
      sender_account_id: sender_account.id,
      receiver_account_id: receiver_account.id
    ).symbolize_keys
  end

  describe 'validations' do
    describe 'success' do
      context 'when record is valid' do
        its(:success?) { is_expected.to be true }
      end
    end

    describe 'failure' do
      context 'when sender_account_id is' do
        context 'empty' do
          before { params[:sender_account_id] = '' }

          its(:success?) { is_expected.to be false }
        end
      end

      context 'when receiver_account_id is' do
        context 'empty' do
          before { params[:receiver_account_id] = '' }

          its(:success?) { is_expected.to be false }
        end

        context 'the same as sender_account_id' do
          let(:error) { I18n.t('dry_validation.errors.account_transaction.rules.receiver_account.invalid') }

          before { params[:receiver_account_id] = params[:sender_account_id] }

          its('errors.messages.first.text') { is_expected.to eq(error) }
        end
      end

      context 'when amount is' do
        context 'empty' do
          before { params[:amount] = '' }

          its(:success?) { is_expected.to be false }
        end

        context 'zero' do
          let(:error) { I18n.t('dry_validation.errors.account_transaction.rules.amount.invalid') }

          before { params[:amount] = 0 }

          its('errors.messages.first.text') { is_expected.to eq(error) }
        end
      end

      context 'when sender_account_balance is' do
        context 'empty' do
          before { params[:sender_account_balance] = '' }

          its(:success?) { is_expected.to be false }
        end

        context 'less than amount' do
          let(:error) { I18n.t('dry_validation.errors.account_transaction.rules.sender_account.invalid') }

          before { params[:sender_account_balance] = -1 }

          its('errors.messages.first.text') { is_expected.to eq(error) }
        end
      end
    end
  end
end
