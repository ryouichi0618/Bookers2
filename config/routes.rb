Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get '/home/about', to: 'homes#about'

  resources :books, only: [:create, :index, :show, :edit, :update, :destroy] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy] 
  end
  post 'follow/:id' => 'relationships#follow', as: 'follow' 
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' 
  resources :users, only: [:index, :show, :edit, :update] do
    member do
      get :following, :followed
    end
  end
end
