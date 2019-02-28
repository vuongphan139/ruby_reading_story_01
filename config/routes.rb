Rails.application.routes.draw do
  root "static_pages#home"
  get "/manager", to: "static_pages#manager", as: "manager"
  get "/signup", to: "users#new"
  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/stories", to: "stories#index", as: "progress_filter"
  resources :users
  resources :account_activations, only: %i(edit)
  resources :stories
  resources :chapters
  get "chapters/:id/:page", to: "chapters#show", as: "chapter_show"
  resources :categories
  resources :comments
  resources :likes
  resources :relationships, only: %i(create destroy)
  resources :following, :followers, only: %i(show)
  resources :search, only: %i(index)
end
