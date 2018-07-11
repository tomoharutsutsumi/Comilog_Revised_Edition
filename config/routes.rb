
Rails.application.routes.draw do
  devise_for :users, controllers: { :omniauth_callbacks => "omniauth_callbacks" }
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
        patch 'release'
        patch 'nonrelease'
    end
  end
  namespace :my do
    get '/likes',:to => "likes#liked"
  end


end