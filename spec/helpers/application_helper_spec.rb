# frozen_string_literal: true

RSpec.describe ApplicationHelper do
  describe '#active_class' do
    describe '#flash_class' do
      it 'returns correct classes' do
        expect(helper.flash_class(:notice)).to eq('alert alert-success')
        expect(helper.flash_class(:success)).to eq('alert alert-success')
        expect(helper.flash_class(:error)).to eq('alert alert-danger')
        expect(helper.flash_class(:alert)).to eq('alert alert-danger')
      end
    end
  end
end
