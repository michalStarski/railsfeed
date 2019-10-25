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
  end

  private

  def sub_params
    params.require(:sub).permit(:name, :background_pic)
  end
end
