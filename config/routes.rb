
Rails.application.routes.draw do
  devise_for :users, controllers: { :omniauth_callbacks => "omniauth_callbacks",
    :sessions => "users/sessions" }
  root 'comics#index'
  resources :users do
    member do
      get :my_posted_comics
    end
  end
  resources :comics do
    collection do
        get :search
        get :header_search
        post :confirm
        get :all_rank
        get :first_day_rank
        get :second_day_rank
        get :third_day_rank
    end
    member do
        post 'like'
        post 'unlike'
        post 'want'
        post 'not_want'
        patch 'release'
        patch 'nonrelease'
    end
  end
  namespace :my do
    get '/likes',:to => "likes#liked"
    get '/wants', :to => "wants#wanted"
  end


end