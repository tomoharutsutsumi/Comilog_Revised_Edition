Rails.application.routes.draw do
  devise_for :users
  root 'comics#index'
  resources :comics
 
end
