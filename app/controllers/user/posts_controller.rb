class User::PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = current_user.posts
  end
end
