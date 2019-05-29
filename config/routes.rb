Rails.application.routes.draw do

  resources :users

  root 'sessions#index'

  get '/login' => 'sessions#new', as: 'login'
  post '/login' => 'sessions#create' 
  delete '/logout' => 'sessions#destroy', as: 'logout'

end
