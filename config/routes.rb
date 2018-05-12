Rails.application.routes.draw do
  devise_for :users
  root 'comics#index'
  resources :users
  resources :comics do
    member do
        post 'like'
        post 'unlike'
    end
  end
  namespace :my do
    get '/likes',:to => 'likes#liked'
  end


end