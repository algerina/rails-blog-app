class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
  end

  def show
    @user = current_user
    @posts = @user.most_recent_posts
  end
end
