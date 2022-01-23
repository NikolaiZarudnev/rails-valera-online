class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by email: params[:email]
    if user&.authenticate(params[:password])
      log_in user
      redirect_to root_path
    else
      redirect_to new_session_path
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end

  private

  def session_params
    params.require(:user).permit(:email, :name, :password)
  end
end
