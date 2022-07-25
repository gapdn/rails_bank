# frozen_string_literal: true

describe Accounts::CreateMapper do
  subject(:mapper) { described_class.new.call(params) }

  let(:params) do
    attributes_for(:account)
  end

  it 'transforms params' do
    expect(mapper[:credit]).to eq described_class::DEFAULT_CREDIT_AMOUNT
    expect(mapper[:credit_currency]).to eq params[:credit_currency]
    expect(mapper[:number].size).to eq described_class::NUMBER_RANGE.size
  end
end
