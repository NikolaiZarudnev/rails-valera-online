require 'rails_helper'

RSpec.describe ValeraAction, type: :model do
  describe '#action' do
    context 'with valid action' do
      let(:valera_action) { create(:valera_action) }

      it { expect(valera_action).to be_valid }
    end
  end
end
