# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :users do
  resources :posts do
    resources :comments
    resources :likes, only: [:create]
    end
  end
  namespace :api, {format: :json} do
    resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :create] do
    resources :comments, only: [:index, :create]

  end
end
end


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
end
