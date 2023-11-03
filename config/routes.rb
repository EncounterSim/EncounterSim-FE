Rails.application.routes.draw do

  root "welcome#index"

  resources :users, only: [:new, :create]
  get "/login", to: "users#login_form"
  post "/login", to: "users#login"
  get '/create_account', to: 'users#new', as: 'create_account'
  get '/logout', to: 'users#destroy'
  resources :monsters, only: [:index]
  resources :encounters, only: [:new, :create], path: 'create_encounter'
end
