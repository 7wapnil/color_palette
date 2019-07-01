Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'

  get 'signup' => 'users#new'

  get 'login' => 'users#login'

  resources :users, except: [:new]
end
