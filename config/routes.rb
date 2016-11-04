Rails.application.routes.draw do
  root 'inquiries#index'
  resources :inquiries
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
