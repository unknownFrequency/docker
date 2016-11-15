Rails.application.routes.draw do
  root 'home#index'
  get 'home'       => 'home#index'
  resources :users
  #match "auth_user" => "users#new", as: :auth_user, via: [:get, :post]
end
