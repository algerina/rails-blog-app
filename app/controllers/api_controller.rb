class ApiController < ApplicationController 
    protect_from_forgery with: :null_session

    def index_posts
      render json: Post.all
    end
  
    def post_comments
      render json: Comment.where(post_id: params[:post_id])
    end
  
    def create_comments
 
      data = JSON.parse(request.raw_post)
      @comment = Comment.create(post_id: data['post_id'], user_id: data['user_id'], text: data['text'])
  
      if @comment.save
        render json: 'Comment created successfully'
      else
        render json: 'Comment not created'
      end
    end
  end