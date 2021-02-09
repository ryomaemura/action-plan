Rails.application.routes.draw do
  root to: "actions#index"

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  get "signup", to: "users#new"
  resources :users, only: [:index, :show, :create]

  resources :actions

  resources :books, only: [:new] do
    collection do
      post :search, to: "books#search"
      get :search, to: redirect("books/new")
    end
  end
end
