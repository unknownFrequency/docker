Rails.application.routes.draw do
  root 'home#index'
  post 'auth_user' => 'application#authenticate_request!'
  get 'home'       => 'home#index'

  resources :users
  get '/users/token/:token' => 'users#token'
  #get '/users/token/:token' => 'users#token'

  #namespace :api do
    #namespace :v1 do
      #resources :users
    #end
  #end
  #post '/users/token', to: 'users#token'
end
