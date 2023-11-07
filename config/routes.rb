Rails.application.routes.draw do

  root "welcome#index"

  resources :users, only: [:new, :create]
  get "/login", to: "users#login_form"
  post "/login", to: "users#login"
  get '/create_account', to: 'users#new', as: 'create_account'
  get '/logout', to: 'users#destroy'
  get '/session_timeout', to: 'users#session_timeout', as: 'session_timeout'

  get '/auth/github/callback', to: 'github#create'
  get 'monsters/page/:page', to: 'monsters#index', as: 'monsters_page'
  resources :monsters, only: [:index, :show] 

  resources :encounters, only: [:new, :create], path: 'create_encounter'
  resources :encounters, only: [:show, :index]

  get 'sessions/create'
end
