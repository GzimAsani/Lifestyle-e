Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :articles, only: [:show, :new, :create]
  resources :categories, only: [:show, :index] 
  get 'signup', to: 'users#new'
  resources :users, only: [:create]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
