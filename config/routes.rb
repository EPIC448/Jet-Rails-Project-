Rails.application.routes.draw do
  get 'flight_ride/new'

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#new'
  get 'flights/index'
  get '/signin' => "sessions#new"
  post '/sessions' => "sessions#create"
  delete '/logout' => "sessions#destroy"

 
   resources :users, :only => [:new, :create, :show]
   resources :flights, only: [:index, :show, :new, :create, :edit, :update]  # access to all the functions.
   
   
   post '/flight_ride/new' => "flight_ride#new"
   
   # root 'flights#index' # i will add it if i need it. 

 end
