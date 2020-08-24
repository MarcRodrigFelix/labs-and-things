Rails.application.routes.draw do

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  resources :users do 
    resources :appointments, only: [:index, :new, :create, :show, :edit, :destroy]
  end

  resources :laboratories do 
    resources :appointments, only: [:index, :show]
  end

  resources :users
  resources :laboratories
  resources :appointments
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
