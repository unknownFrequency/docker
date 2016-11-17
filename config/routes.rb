Rails.application.routes.draw do
  root 'home#index'
  post 'auth_user' => 'application#authenticate_request!'
  get 'home'       => 'home#index'

  resources :users

  get 'send_login', to: 'sessions#new'
  post 'send_login', to: 'sessions#create'
  get '/sessions/token/:token' => 'sessions#token'
end
