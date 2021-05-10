Rails.application.routes.draw do
  
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :relationships, only: [:create, :destroy]

  root 'static_pages#home'
  get '/dashbord',to: 'static_pages#index'
  
  get '/members',to: 'users#index'
  get '/profile' ,to: 'users#show'
 
  get '/signup',to: 'users#new'
  get '/setting', to: 'users#setting'

  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'
  
  
  resources :users do
    member do
       get :following, :followers
    end
  end
end
