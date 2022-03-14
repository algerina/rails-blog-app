class UsersController < ApplicationController
  def index
    @users = User.all.find(params[:id])
  end

  def show
  #   @user_id = user.find_by(id: params[:id])
  # @posts = User.recent_posts(@user_id)
  end
end
