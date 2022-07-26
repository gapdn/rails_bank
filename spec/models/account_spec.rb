# frozen_string_literal: true

RSpec.describe Account do
  describe 'columns' do
    it { is_expected.to have_db_column(:number) }
    it { is_expected.to have_db_column(:credit_cents) }
    it { is_expected.to have_db_column(:credit_currency) }
  end

  describe 'indexes' do
    it { is_expected.to have_db_index(:user_id) }
  end

  describe 'relations' do
    it { is_expected.to belong_to(:user) }
  end
end
