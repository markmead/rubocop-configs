class UserLikesController < ApplicationController
  def index
    @posts = current_user.find_up_voted_items
  end
end
