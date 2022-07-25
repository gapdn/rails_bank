# frozen_string_literal: true

describe CrudService do
  subject { -> { described_class.call(params) } }

  let(:params) { {} }

  describe '#contract' do
    it { is_expected.to raise_error(NotImplementedError) }
  end

  describe '#run' do
    let(:contract) { OpenStruct.new(failure?: false) }
    let(:service) { described_class.new(params) }

    before { allow(service).to receive(:contract).and_return(contract) }

    it { expect { service.call }.to raise_error(NotImplementedError) }
  end
end
