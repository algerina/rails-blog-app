class Api::UsersController < ApplicationController
    respond_to :json, :xml
    def index
        # GET /users
    @users = User.all
    render :json => User.all
    end

  # GET /users/:id
    def show
    render json: User.find(params[:id])
    end
  end