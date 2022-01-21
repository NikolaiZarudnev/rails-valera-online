
require 'rails_helper'

RSpec.describe 'StatsRecords', type: :request do
  describe 'Request index' do
    subject = 'test'
    it 'assigns stats_record name' do
      stats_record = StatsRecord.create(name: 'test')

      expect(subject).to eq(stats_records.name)
    end

    it 'assigns the all stats_records' do
      subject { StatsRecord.all }
      expect(subject).to eq('test')
    end
  end
end
