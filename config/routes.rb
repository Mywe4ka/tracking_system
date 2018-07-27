Rails.application.routes.draw do
  resources :users
  resources :tickets do
    collection do
      get :search
    end
    member do
      get :reply_window
      post :submit_reply
    end
  end

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  root 'tickets#new'
end
