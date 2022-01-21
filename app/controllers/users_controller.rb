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
      asd = action_effect["conditions"]
      #qwe = {"id":5, "attr_name":"tired", "min":0, "max":10, "attr_name_eff":"health", "value_eff":0, "valera_action_id":2, "created_at":"2022-01-20T22:48:22.699Z", "updated_at":"2022-01-20T22:48:22.699Z"}
      asdcond = "\"conds\"[" + asd + "]"
      qwe = asdcond.gsub('\"', '"').gsub('} {', '}, {').gsub('=>', ": ")
      "{\"id\"=>4, \"attr_name\"=>\"alcohol\", \"min\"=>0, \"max\"=>70, \"attr_name_eff\"=>\"health\", \"value_eff\"=>0, \"valera_action_id\"=>2, \"created_at\"=>\"2022-01-20T22:48:05.201Z\", \"updated_at\"=>\"2022-01-20T22:48:05.201Z\"} {\"id\"=>5, \"attr_name\"=>\"tired\", \"min\"=>0, \"max\"=>10, \"attr_name_eff\"=>\"health\", \"value_eff\"=>0, \"valera_action_id\"=>2, \"created_at\"=>\"2022-01-20T22:48:22.699Z\", \"updated_at\"=>\"2022-01-20T22:48:22.699Z\"}"
      eee = JSON.parse('{"cond": {"id": 4, "attr_name": "alcohol", "min": 0, "max": 70, "attr_name_eff": "health", "value_eff": 0, "valera_action_id": 2, "created_at": "2022-01-20T22:48:05.201Z", "updated_at": "2022-01-20T22:48:05.201Z"}, "cond": {"id": 6}}')
      redirectv_to
      if @user.update(stats_update action_effect)
        redirectv_to @user
      else
        render 'edit'
      end
    end

    def stats_update(action_effect)
      conds_check action_effect
      action_effect["health"] = action_effect["health"].to_i + @user.health
      action_effect["alcohol"] = action_effect["alcohol"].to_i + @user.alcohol
      action_effect["happy"] = action_effect["happy"].to_i + @user.happy
      action_effect["tired"] = action_effect["tired"].to_i + @user.tired
      action_effect["money"] = action_effect["money"].to_i + @user.money
      action_effect
    end

    def conds_check(action_effect)

    end
end
