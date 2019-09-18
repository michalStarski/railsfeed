class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    return User.find(session[:user_id]) unless session[:user_id].nil?
  end
end
