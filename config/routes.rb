Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  get 'users/show'
  root 'users#show'
  get '/login', to: 'sessions#new'
  get '/signup', to: 'users#new'
  get '/logout', to: 'sessions#destroy'
  post '/signup', to: 'users#create'
  post '/login', to: 'sessions#create'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
