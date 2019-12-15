class HomeController < ApplicationController
  def index
    @highlighted_subs = Sub.order('RANDOM()').limit(5)

    # Handle my feed
    if current_user
      @my_feed_posts = Post.where(
        sub_id: current_user.subs
      ).order('created_at DESC').limit(4).inspect
    end

  end
end
