class PostsController < ApplicationController
  before_action :require_user

  def create
    @post = Post.new(post_params)
    @post.user = User.find_by_id(session[:user_id])

    if @post.save
      flash[:notice] = ['Post creation successful']
      redirect_to @post
    else
      error_msg = @post.errors.full_messages
      flash.now[:notice] = error_msg
      render 'new', object: @post
    end
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find_by_id(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :sub_id)
  end
end
