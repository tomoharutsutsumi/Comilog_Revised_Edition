Rails.application.routes.draw do
  devise_for :users
  root 'comics#index'
  resources :users do
    resources :comics do
      member do
        post 'like'
        post 'unlike'
      end
    end
  end
end
