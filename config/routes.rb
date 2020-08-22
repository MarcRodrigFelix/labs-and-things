Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resources :laboratories
  resources :appointments

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  resources :users do 
    resources :appointments
  end

  resources :laboratories do
    resources :appointments
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
