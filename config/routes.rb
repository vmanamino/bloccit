Rails.application.routes.draw do
  

  get 'comments/new'

  devise_for :users
  resources :users, only: [:update, :show]
  resources :topics do
    resources :posts, except: [:index]
  end
  
  resources :posts, only: [] do
    resources :comments, only: [:new, :create, :destroy]
    resources :favorites, only: [:create, :destroy]
    post '/up-vote' => 'votes#up_vote', as: :up_vote
    post '/down-vote' => 'votes#down_vote', as: :down_vote
  end
  
  get 'about' => 'welcome#about'

  root to: "welcome#index"
end