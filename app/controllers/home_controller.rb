class HomeController < ApplicationController
  def index
    @highlighted_subs = Sub.order('RANDOM()').limit(5)
  end
end
