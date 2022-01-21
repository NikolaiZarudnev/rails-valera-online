
require 'rails_helper'

RSpec.describe 'ValeraActions', type: :request do
  describe 'Request index' do
    subject = 'test'
    it 'assigns valera_action name' do
        valera_action = ValeraAction.create(name: 'test')

      expect(subject).to eq(valera_action.name)
    end

    it 'assigns the all valera_actions' do
      subject { ValeraAction.all }
      expect(subject).to eq('test')
    end
  end
end
