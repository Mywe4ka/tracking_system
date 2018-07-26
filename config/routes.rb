Rails.application.routes.draw do
  resources :tickets
  resources :users

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  root 'tickets#new'
end
