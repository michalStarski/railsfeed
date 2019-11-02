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
    @user_reaction = Vote.where(user_id: @user.id, post_id: @post.id).first
    @likes = Vote.where(reaction: 'like').count
    @dislikes = Vote.where(reaction: 'dislike').count
    @like_btn_class = @user_reaction&.reaction == 'like' ? 
      'mdl-button mdl-js-button mdl-button--primary': 
      'mdl-button mdl-js-button mdl-button--raised mdl-button--colored'
    @dislike_btn_class = @user_reaction&.reaction =='dislike' ?
      'mdl-button mdl-js-button mdl-button--accent':
      'mdl-button mdl-js-button mdl-button--raised mdl-button--accent'
  end

  def reaction
    @post = Post.find_by_id(params[:post_id])
    @previous_reaction = Vote.where(user_id: current_user.id, post_id: @post.id).first

    current_user = User.find(session[:user_id])
    reaction_type = params[:type]

    if @previous_reaction
      @previous_reaction.destroy
      return redirect_to @post if @previous_reaction&.reaction == reaction_type
    end

    @vote = Vote.new(user: current_user, post: @post, reaction: reaction_type)
    
    if (reaction_type == "like" || "dislike") && @vote.save
      flash[:notice] = ['Successfully reacted to a post']
      redirect_to @post
    else
      error_msg = @vote.errors.full_messages
      flash.now[:notice] = error_msg
      render @post
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :sub_id)
  end
end
