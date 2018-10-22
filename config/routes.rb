
Rails.application.routes.draw do
  devise_for :users, controllers: { :omniauth_callbacks => "omniauth_callbacks",
    :sessions => "users/sessions" }
  root 'comics#index'
  resources :users
  resources :comics do
    collection do
        get :search
        get :header_search
        get :rank
    end
    member do
        post 'like'
        post 'unlike'
        post 'want'
        patch 'release'
        patch 'nonrelease'
    end
  end
  namespace :my do
    get '/likes',:to => "likes#liked"
    get '/wants', :to => "wants#wanted"
  end


end