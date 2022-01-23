class StatsRecordsController < ApplicationController
  def index
    @stats_records = StatsRecord.all
  end

  def new
    @stats_record = StatsRecord.new
  end

  def edit
    @stats_record = StatsRecord.find(params[:id])
  end

  def create
    @stats_record = StatsRecord.create(stats_record_params)
    redirect_to root_path
  end

  def update
    if user_signed_in?
      @stats_record = StatsRecord.find(params[:id])
      stats_record_update
    else
      redirect_to root_path
    end
  end

  private

  def stats_record_params
    params.permit!
  end

  def stats_record_save
    if @stats_record.save
      redirect_to @stats_record
    else
      render 'new'
    end
  end

  def stats_record_update
    if @stats_record.update(stats_record_params)
      redirect_to @stats_record
    else
      render 'edit'
    end
  end
end
