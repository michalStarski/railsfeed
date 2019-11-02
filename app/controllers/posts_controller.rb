class PostsController < ApplicationController
  before_action :require_user, only: %i[create new reaction]

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
    @sub = Sub.find(@post.sub_id)
    @user = User.find_by_id(@post.user_id)
    @has_reacted = Vote.where(user_id: @user.id, post_id: @post.id)
  end

  def reaction
    @post = Post.find_by_id(params[:post_id])
    current_user = User.find(session[:user_id])

    @has_reacted = Post.first
    reaction_type = params[:type]
    
    if @post.save
      @vote = Vote.new(user: current_user, post: @post, type: 'like')
      @vote.save
      flash[:notice] = ['Successfully reacted to a post']
      redirect_to @post
    else
      error_msg = @post.errors.full_messages
      flash.now[:notice] = error_msg
      render @post
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :sub_id)
  end
end
