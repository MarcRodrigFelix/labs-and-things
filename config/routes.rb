Rails.application.routes.draw do
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  get '/auth/google_oauth2/callback', to: 'sessions#create_with_google_oauth'

  resources :laboratories do 
    resources :appointments
  end

  resources :users
  resources :laboratories
  resources :appointments
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
