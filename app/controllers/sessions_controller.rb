class SessionsController < ApplicationController
  def new; end

  def create
    email = params[:email]
    password = params[:password]
    user = User.find_by_email(email)
    if user&.authenticate(password)
      session[:user_id] = user.id
      flash[:notice] = ['Logged in succesfully!']
      redirect_to root_url
    else
      flash.now[:error] = ['Email or password is invalid']
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = ['Logged out succesfully!']
    redirect_to root_url
  end

end
