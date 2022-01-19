class HomeController < ApplicationController
    def index
        redirect_to new_user_state_path(current_user) if user_signed_in?
    end
end
