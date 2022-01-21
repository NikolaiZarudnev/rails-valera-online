class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

    def new
      @user = User.new
    end
    
    def create
      @user = User.new(user_params)
      @user.health = 100
      @user.alcohol = 0
      @user.happy = 0
      @user.tired = 0
      @user.money = 300
      if @user.save
        log_in @user
        redirect_to root_path
      else
        render 'new'
      end
      
    end
    def edit
      if user_signed_in?
        @user = User.find(params[:id])
      else
        redirect_to root_path
      end
    end
    def update
      if user_signed_in?
        @user = User.find(params[:id])
        user_update
      else
        redirect_to root_path
      end
    end
    private
  
    def user_params
      params.require(:user).permit(:email, :name, :password, :password_confirmation)
    end
  
    def user_save
      if @user.save
        redirect_to @user
      else
        render 'new'
      end
    end
  
    def user_update
      #redirectv_to
      action_effect = params[:user].permit!
      conds = ValeraAction.find(action_effect["action_id"]).conditions
      
      if action_available?(conds)
        select_effects!(conds, action_effect)
        new_stat = stats_update!(action_effect)
        @user.update(new_stat)
        redirect_to @user
      else
        redirect_to @user, notice: "You cannot do it"
      end
    end

    def stats_update!(action_effect)
      new_stat = {"health"=> 0, "alcohol"=> 0, "happy"=> 0, "tired"=> 0, "money"=>0} 
      new_stat["health"] = action_effect["health"].to_i + @user.health
      new_stat["alcohol"] = action_effect["alcohol"].to_i + @user.alcohol
      new_stat["happy"] = action_effect["happy"].to_i + @user.happy
      new_stat["tired"] = action_effect["tired"].to_i + @user.tired
      new_stat["money"] = action_effect["money"].to_i + @user.money
      new_stat
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
end
