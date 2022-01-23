class UsersController < ApplicationController
  include UsersHelper
  def show
    @user = User.find(params[:id])
    save_max_stat
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    new_stat!(@user)
    user_save
  end

  def edit
    if user_signed_in?
      @user = User.find(params[:id])
    else
      redirect_to @user
    end
  end

  def update
    if user_signed_in?
      @user = User.find(params[:id])
      user_update
    else
      redirect_to @user
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end

  def user_save
    if @user.save
      log_in @user
      save_max_stat
      redirect_to @user
    else
      render 'new'
    end
  end

  def user_update
    action_effect = params[:user].permit!
    if action_effect['action_id'] == 'New game'
      new_stat!(@user)
    else
      do_action action_effect
    end
    user_save
  end

  def do_action(action_effect)
    conds = ValeraAction.find(action_effect['action_id']).conditions
    if action_available?(conds)
      select_effects!(conds, action_effect, @user)
      updated_stat = stats_update(action_effect, @user)
      validate_stats!(updated_stat, @user)
      @user.update(updated_stat)
      flash.notice = 'You died.' if dead?(@user)
    else
      flash.notice = 'You cannot do it.'
    end
  end

  def action_available?(conds)
    conds.each do |cond|
      next unless cond.attr_name_eff == 'none'

      unless cond_is_true?(cond, @user)
        flash.alert = "Your '#{cond.attr_name}' should be between #{cond.min} and #{cond.max}."
        return false
      end
    end
    true
  end

  def save_max_stat
    if StatsRecord.exists?(@user.id)
      @stats_record = StatsRecord.find(@user.id)
      @stats_record.money = [@stats_record.money, @user.money].max
    else
      @stats_record = StatsRecord.create(id: @user.id, name: @user.name, money: @user.money)
    end
    @stats_record.save!
  end
end
