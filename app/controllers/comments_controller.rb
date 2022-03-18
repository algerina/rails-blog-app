class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.create(post: @post, author: @user, text: params[:comment][:text])

    if @comment.valid?
      @comment.save
      # redirect_to user_post_path(id: @post.id, user_id: @user.id)
      flash.notice = "Comment added successfuly."
    else
      # redirect_to new_user_post_comment_path(@user.id, @post.id)
      flash.alert = "Please try again."
    end
    redirect_to new_user_post_comment_path(@user.id, @post.id)

  end

  def post_params
    params.require(:comment).permit(:text)
  end
end
