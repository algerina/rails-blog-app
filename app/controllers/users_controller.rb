class UsersController < ApplicationController
  # before_action :authenticate_user!
  def index
    @users = User.order(:id)
  end

  def show
    @user = current_user
    # @posts = @user.most_recent_posts
    @post = User.find(params[:id])

  end
end
