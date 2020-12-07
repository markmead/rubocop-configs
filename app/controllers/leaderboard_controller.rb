class LeaderboardController < ApplicationController
  def index
    @users = User.most_active
  end
end
