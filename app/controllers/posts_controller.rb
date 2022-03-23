class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
  end

  def show
    @user_id = params[:user_id]
    @post_id = params[:id]
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @current_user = User.find(params[:user_id])
    post = Post.new(post_params.merge(author_id: @current_user.id, comments_counter: 0, likes_counter: 0))
    if post.valid?
      post.save
      flash.notice = 'Post added successfuly.'
    else
      flash.alert = "Couldn't add the post."
    end
    redirect_to user_path(@current_user.id)
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
