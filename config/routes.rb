Rails.application.routes.draw do
  get 'articles/index'
  get 'articles/new'
  devise_for :users
  
  resources :items, only: [:index, :new, :create]
  root to: "items#index"
  
end
