Rails.application.routes.draw do
  root to: 'homes#top'  
  devise_for :users
  resources :books, only: [:create, :index, :show, :edit, :update, :destroy]
end
