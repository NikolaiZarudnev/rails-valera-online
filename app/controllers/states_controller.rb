class StatesController < ApplicationController
    def index
        @user = User.find(params[:user_id])
        @state = @user.state.find(params[:id])
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
    end

    def create
        @state = State.find(params[:user_id])
        @state = @user.states.create(state_params)
        redirect_to root_path
    end

    def update; end #zdes menyat state ot action

    def destroy; end

    private

    def state_params
        params.require(:state).permit(:health, :alcohol, :happy, :tired, :money)
    end
end

  