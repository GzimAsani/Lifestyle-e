Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :articles, only: [:show, :new, :create]
  resources :categories, only: [:show, :index] 
end
