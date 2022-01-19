class StatesController < ApplicationController
    def index
        @states = State.all
    end

    def show
        @user = User.find(params[:user_id])
        @state = @user.states.find(params[:id])
    end

    def new
        @user = User.find(params[:user_id])
        @state = State.new
        @state.health = 100
        @state.alcohol = 0
        @state.happy = 0
        @state.tired = 0
        @state.money = 300
        @state.save
    end

    def create
        @user = User.find(params[:user_id])
        @state = @user.state.create(params)
        redirect_to root_path
    end
    def edit
        @user = User.find(params[:user_id])
        @state = @user.states.find(params[:id])
    end
    def update
        @user = User.find(params[:user_id])
        @state = @user.states.find(params[:id])
    
        @state.update(state_params)
    
        redirect_to user_path(@user)
    end
    

    def destroy; end

    private

    def state_params
        params.require(:state).permit(:user_id)
    end
end

  