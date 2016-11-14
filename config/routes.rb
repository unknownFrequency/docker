Rails.application.routes.draw do
  get 'users/new'

  get 'users/create'

  get 'users/index'

  get 'users/update'

  get 'users/delete'

  root 'home#index'
  post 'auth_user' => 'authentication#authenticate_user'
  get 'home'       => 'home#index'
end
