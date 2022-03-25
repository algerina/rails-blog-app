class Api::CommentsController < ApplicationController
    def new
      @current_user = User.find(params[:user_id])
      @comment = Comment.new
    end
  
    def create
      @user = User.find(params[:user_id])
      @post = Post.find(params[:post_id])
      @comment = Comment.create(post: @post, author: @user, text: params[:comment][:text])
  
      if @comment.valid?
        @comment.save
        render json: {
        messages:'Comment added successfuly.'
        is_success: true
      }, status: ok
      else
        render json: {
            messages: 'Error',
            is_success: false
          }, status: failure
        end
    end
  
    def post_params
      params.require(:comment).permit(:text)
    end
  end
  