Rails.application.routes.draw do
  get 'users/show'
  root to: 'homes#top'  
  devise_for :users
  resources :books, only: [:create, :index, :show, :edit, :update, :destroy]
  resources :users, only: [:show, :edit, :update]
end
