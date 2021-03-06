Rails.application.routes.draw do resources :gallery_images
  resources :galleries
  resources :gallery_images

  resources :users do
    get '/users/uploads'
    put "like", to: "users#upvote"
    put "dislike", to: "users#downvote"
  end

  root 'home#index'
  get 'home/index', to: 'home#index'

  post 'auth_user',  to: 'application#authenticate_request!'

  ## SESSIONS ##
  get  'send_login', to: 'sessions#new'
  post 'send_login', to: 'sessions#create'
  match  '/sessions' => 'sessions#token', via: [:get]
  match  '/sessions/:token' => 'sessions#token', via: [:get]
end
