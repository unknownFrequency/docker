Rails.application.routes.draw do resources :gallery_images
  resources :galleries
  root 'home#index'
  get 'home/index', to: 'home#index'

  post 'auth_user',  to: 'application#authenticate_request!'
  #resources :sessions
  get  'send_login', to: 'sessions#new'
  post 'send_login', to: 'sessions#create'
  #get  '/sessions/token/:token', to: 'sessions#token'
  match  '/sessions' => 'sessions#token', via: [:get]
  match  '/sessions/:token' => 'sessions#token', via: [:get]
  #post  '/sessions/token/:token' => 'sessions#token'
  #get '/sessions/', to: 'sessions#token'
end
