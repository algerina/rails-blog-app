class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    # @user = current_user
    @posts = @user.most_recent_posts
  end
end
