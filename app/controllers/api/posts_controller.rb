class Api::PostsController < ApplicationController
    # before_action :authenticate_user!
  
    def index
      @user = User.find(params[:user_id])
      @posts = @user.posts.includes(:comments)
      @post_id = params[:id]
      render json: @posts
    end
  
    def show
      @user = User.find(params[:user_id])
  
      @post = Post.find(params[:id])
      render json: @posts
    end



  end