Rails.application.routes.draw do
  resources :users
  resources :tickets do
    collection do
      get :search
    end
  end

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  root 'tickets#new'
end
