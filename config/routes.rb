Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get '/home/about', to: 'homes#about'

  resources :books, only: [:create, :index, :show, :edit, :update, :destroy] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy] 
  end
  resources :users, only: [:index, :show, :edit, :update]
end
