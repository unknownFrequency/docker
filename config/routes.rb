Rails.application.routes.draw do resources :gallery_images
  resources :galleries
  root 'home#index'
  get 'home/index', to: 'home#index'

  post 'auth_user',  to: 'application#authenticate_request!'
  resources :sessions
  get  'send_login', to: 'sessions#new'
  post 'send_login', to: 'sessions#create'
  get  '/sessions/token/:token', to: 'sessions#token'
  get  '/sessions/:token', to: 'sessions#token'
  get '/sessions/', to: 'sessions#token'
end
