require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#user' do
    context 'Go to work' do
      let(:valera_action) { valera_action = FactoryBot.create(:valera_action) }

      it { expect(valera_action.health).to eq 1 }
      it { expect(valera_action.money).to eq 1 }
    end
  end
end
