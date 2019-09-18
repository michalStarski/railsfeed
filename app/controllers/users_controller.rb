class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'User creation successful'
      redirect_to root_path
    else
      error_msg = @user.errors.full_messages
      flash.now[:notice] = error_msg
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :password,
                                 :password_confirmation)
  end
end
