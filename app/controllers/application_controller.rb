class ApplicationController < ActionController::Base
  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id].present?
  end

  def user_signed_in?
    current_user.present?
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete :user_id
    # @current_user = nil
  end
  helper_method :current_user, :user_signed_in?, :log_in
end
