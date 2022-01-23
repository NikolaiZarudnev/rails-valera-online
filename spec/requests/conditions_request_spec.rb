require 'rails_helper'

RSpec.describe 'Conditions', type: :request do
  describe 'Request index' do
    subject = 'test'
    it 'assigns condition attr_name' do
      condition = Condition.create(attr_name: 'test')

      expect(subject).to eq(condition.attr_name)
    end

    it 'assigns the all stats_records' do
      subject { Condition.all }
      expect(subject).to eq('test')
    end
  end
end
