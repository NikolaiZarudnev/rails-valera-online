class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    dead?
  end

    def new
      @user = User.new
    end
    
    def create
      @user = User.new(user_params)
      new_stat
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
        redirect_to @user
      else
        render 'new'
      end
    end
  
    def user_update
      #redirectv_to
      action_effect = params[:user].permit!
      if action_effect["action_id"] == "New game"
        new_stat
        user_save
        return
      end

      conds = ValeraAction.find(action_effect["action_id"]).conditions
      if action_available?(conds)
        select_effects!(conds, action_effect)
        updated_stat = stats_update(action_effect)
        validate_stats!(updated_stat)
        @user.update(updated_stat)
        if dead?
          flash.notice = "You died."
        end
      else
        flash.notice = "You cannot do it."
      end
      redirect_to @user
    end

    def stats_update(action_effect)
      updated_stat = {"health"=> 0, "alcohol"=> 0, "happy"=> 0, "tired"=> 0, "money"=>0} 
      updated_stat["health"] = action_effect["health"].to_i + @user.health
      updated_stat["alcohol"] = action_effect["alcohol"].to_i + @user.alcohol
      updated_stat["happy"] = action_effect["happy"].to_i + @user.happy
      updated_stat["tired"] = action_effect["tired"].to_i + @user.tired
      updated_stat["money"] = action_effect["money"].to_i + @user.money
      updated_stat
    end
    
    def new_stat
      @user.health = 100
      @user.alcohol = 0
      @user.happy = 0
      @user.tired = 0
      @user.money = 300
    end

    def select_effects!(conds, action_effect)
      conds.each do |cond|
        unless cond.attr_name_eff == 'none'
          if cond_is_true?(cond)
            action_effect[cond.attr_name_eff] = cond.value_eff
          end
        end
      end
    end

    def action_available?(conds)
      conds.each do |cond|
        if cond.attr_name_eff == 'none'
          if !cond_is_true?(cond)
            flash.alert = "Your '#{cond.attr_name}' should be between #{cond.min} and #{cond.max}."
            return false
          end
        end
      end
      true
    end

    def cond_is_true?(condition)
      if !condition.nil?
        @user[condition.attr_name].between?(condition.min, condition.max)
      end
    end

    def dead?
      @user.health.zero? || @user.happy == -10 || @user.money <= -100 || @user.tired == 100
    end
    def validate_stats!(stats)
      stats["health"] = valid_health(stats["health"])
      stats["alcohol"] = valid_alcohol(stats["alcohol"])
      stats["happy"] = valid_happy(stats["happy"])
      stats["tired"] = valid_tired(stats["tired"])
    end
    def valid_health(health)
      health = validate(health, 0, 100)
    end
  
    def valid_alcohol(alcohol)
      @user.health -= validate(@user.alcohol - alcohol, 0, @user.health) if @user.alcohol < alcohol.abs
      alcohol = validate(alcohol, 0, 100)
    end
  
    def valid_happy(happy)
      happy = validate(happy, -10, 10)
    end
  
    def valid_tired(tired)
      tired = validate(tired, 0, 100)
    end
  
    def validate(value, min, max)
      [[value, max].min, min].max
    end
end
