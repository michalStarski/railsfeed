class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    return User.find(session[:user_id]) unless session[:user_id].nil?
  end

  def require_admin
    user = User.find_by_id(session[:user_id])
    redirect_to root_url, status: 403 unless user&.is_admin
  end
end
