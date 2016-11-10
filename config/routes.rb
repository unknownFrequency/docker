Rails.application.routes.draw do
  root 'home#index'

  post 'auth_user' => 'authentication#authenticate_user'
  get 'home'       => 'home#index'
end
