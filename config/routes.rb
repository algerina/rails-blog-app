# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users
  resources :users do
  resources :posts do
  resources :comments
  resources :likes, only: [:create]
    end
  end

get '/api/users/:user_id/posts', to: 'api#index_posts'
get '/api/users/:user_id/posts/:post_id/comments', to: 'api#post_comments'
post '/api/users/:user_id/posts/:post_id/comment', to: 'api#create_comments'


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
end
