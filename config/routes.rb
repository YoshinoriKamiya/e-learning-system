Rails.application.routes.draw do
  
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  root 'static_pages#home'
  get '/dashbord',to: 'users#show'
  get '/members',to: 'users#index'
 
  get '/signup',to: 'users#new'
  get '/setting', to: 'users#setting'
  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'
  
  get '/dashboard',to:'users#show'
end
