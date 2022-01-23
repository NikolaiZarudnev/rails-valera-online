require 'rails_helper'

RSpec.describe 'StatsRecords', type: :request do
  describe 'Request index' do
    subject = 'test'
    it 'assigns stats_record name' do
      stats_record = StatsRecord.create(id: 1, name: 'test', money: 400)

      expect(subject).to eq(stats_record.name)
    end
  end
end
