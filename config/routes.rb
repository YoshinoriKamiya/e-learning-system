Rails.application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :relationships, only: [:create, :destroy]

  root 'static_pages#home'
  get '/dashboard',to: 'static_pages#index'
  
  get '/members',to: 'users#index'
  get '/profile' ,to: 'users#show'
  get '/signup',to: 'users#new'
  get '/setting', to: 'users#setting'

  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'
  
  resources :categories
  resources :words

  get '/categories/:category_id/words/new', to: 'words#new', :as => :new_category_words

  get '/categories/:category_id/words', to: 'words#index', :as => :category_words_list

  get '/categories/words', to: 'categories#show', :as => :category_words

  get '/categories/:category_id/words/:word_id/edit', to: 'words#edit', :as => :edit_category_words

  get '/categories/:category_id/words/', to: 'words#index', :as => :words_path
  
  resources :users do
    member do
       get :following, :followers
    end
  end
end
