Rails.application.routes.draw do
  root 'home#index'
  post 'auth_user' => 'application#authenticate_request!'
  #post '/users/token', to: 'users#token'
  post '/users/:token', to: 'users#token'
  get 'home'       => 'home#index'
  resources :users

  #namespace :api do
    #namespace :v1 do
      #resources :users
    #end
  #end
end
