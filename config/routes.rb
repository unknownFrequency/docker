Rails.application.routes.draw do
  root 'home#index'
  get 'home/index', to: 'home#index'

  post 'auth_user',  to: 'application#authenticate_request!'
  get  'send_login', to: 'sessions#new'
  post 'send_login', to: 'sessions#create'
  get '/sessions/token/:token', to: 'sessions#token'
end
