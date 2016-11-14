Rails.application.routes.draw do
  root 'home#index'
  post 'auth_user' => 'authentication#authenticate_user'
  get 'home'       => 'home#index'
  resources :users
  get 'signup', to: 'users#new'
end
