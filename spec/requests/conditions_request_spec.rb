require 'rails_helper'

RSpec.describe 'Conditions', type: :request do
  describe 'Request index' do
    subject = 'test'
    it 'assigns condition attr_name' do
      condition = Condition.create(id: 1, attr_name: 'test')

      expect(subject).to eq(condition.attr_name)
    end
  end
end
