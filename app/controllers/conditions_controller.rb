class ConditionsController < ApplicationController
  def show
    @valera_action = ValeraAction.find(params[:valera_action_id])
    @condition = @valera_action.conditions.find(params[:id])
  end

  def new
    @valera_action = ValeraAction.find(params[:valera_action_id])
    @condition = Condition.new
  end

  def edit
    @valera_action = ValeraAction.find(params[:valera_action_id])
    @condition = @valera_action.conditions.find(params[:id])
  end

  def create
    @valera_action = ValeraAction.find(params[:valera_action_id])
    @condition = @valera_action.conditions.create(condition_params)
    redirect_to valera_action_path(@valera_action)
  end

  def update
    @valera_action = ValeraAction.find(params[:valera_action_id])
    @condition = @valera_action.conditions.find(params[:id])

    @condition.update(condition_params)

    redirect_to valera_action_path(@valera_action)
  end

  def destroy
    @valera_action = ValeraAction.find(params[:valera_action_id])
    @condition = @valera_action.conditions.find(params[:id])
    @condition.destroy
    redirect_to valera_action_path(@valera_action)
  end

  private

  def condition_params
    params.require(:condition).permit!
  end
end
