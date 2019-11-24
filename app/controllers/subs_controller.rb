class SubsController < ApplicationController
  before_action :require_admin, only: %i[create new]

  def new
    @sub = Sub.new
  end

  def create
    @sub = Sub.new(sub_params)
    if @sub.save
      flash[:notice] = ['Sub creation successful']
      redirect_to @sub
    else
      error_msg = @sub.error.full_messages
      flash.now[:notice] = error_msg
      render :new
    end
  end

  def show
    @sub = Sub.find_by_id(params[:id])
    @posts = Post.where(sub_id: @sub.id)
    @has_user_followed = has_user_followed(@sub)
  end

  def follow
    @sub = Sub.find(params[:id])

    if current_user.subs.where(id: @sub.id).empty?
      current_user.subs << @sub
      flash[:notice] = ["Successfully followed: #{@sub.name}"]
      redirect_to @sub
    else
      unfollow(@sub)
    end
  end

  private

  def sub_params
    params.require(:sub).permit(:name, :background_pic)
  end

  def unfollow(sub)
    current_user.subs.delete(sub.id)
    flash[:notice] = ["Successfully unfollowed: #{@sub.name}"]
    redirect_to @sub
  end

  def has_user_followed(sub)
    begin
      current_user&.subs&.find(sub.id)
    rescue ActiveRecord::RecordNotFound
      return false
    end

    true
  end
end
