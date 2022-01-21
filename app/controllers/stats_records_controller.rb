class StatsRecordsController < ApplicationController
  def index
    @stats_records = StatsRecord.all
  end
end
