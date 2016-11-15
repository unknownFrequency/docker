Rails.application.routes.draw do
  root 'home#index'
  #post 'auth_user' => 'authentication#authenticate_user'
  get 'home'       => 'home#index'
  resources :users
  #get 'signup', to: 'users#new'
  #post 'auth_user' => 'application#authenticate_user'#, as: :auth_user
  match "auth_user" => "users#new", as: :auth_user, via: [:get, :post]
end
