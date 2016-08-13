Rails.application.routes.draw do
  resources :users
  get 'signup', to: 'users#new'
  get 'admin-controller', to: 'pages#admin_controller'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root  'pages#home'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
