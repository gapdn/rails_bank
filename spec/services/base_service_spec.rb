# frozen_string_literal: true

describe BaseService do
  subject { -> { described_class.call } }

  it { is_expected.to raise_error(NotImplementedError) }
end
