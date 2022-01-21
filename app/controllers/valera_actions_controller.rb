class ValeraActionsController < ApplicationController
  def index
    @valera_actions = ValeraAction.all
  end

  def show
    @valera_action = ValeraAction.find(params[:id])
  end

  def new
    @valera_action = ValeraAction.new
  end

  def edit
    if user_signed_in?
      @valera_action = ValeraAction.find(params[:id])
    else
      redirect_to user_path(current_user)
    end
  end

  def create
    if user_signed_in?
      @valera_action = ValeraAction.new(valera_action_params)
      valera_action_save
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    if user_signed_in?
      @valera_action = ValeraAction.find(params[:id])
      valera_action_update
    else
      redirect_to user_path(current_user)
    end
  end

  def destroy
    if user_signed_in?
      @valera_action = ValeraAction.find(params[:id])
      @valera_action.destroy
    end
    redirect_to user_path(current_user)
  end

  private

  def valera_action_params
    params.require(:valera_action).permit(:name, :health, :alcohol, :happy, :tired, :money)
  end

  def valera_action_save
    if @valera_action.save
      redirect_to user_path(current_user)
    else
      render 'new'
    end
  end

  def valera_action_update
    if @valera_action.update(valera_action_params)
      redirect_to user_path(current_user)
    else
      render 'edit'
    end
  end
end
