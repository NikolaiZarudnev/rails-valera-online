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
      asd = params[:user].permit!
      asd["health"] = asd["health"].to_i + @user.health#todo helper
      if @user.update(asd)
        redirect_to @user
      else
        render 'edit'
      end
    end
end
