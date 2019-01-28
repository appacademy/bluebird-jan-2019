Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get '/users', to: 'users#index'
  # get '/users/:id', to: 'users#show'
  # post '/users/', to: 'users#create'
  # patch '/users/:id', to: 'users#update'
  # delete '/users/:id', to: 'users#destroy'

  # resources :users, only: [:new, :edit] # opposite of except
  resources :users, except: [:new, :edit] do 
    # did create instead of index
    
    resources :chirps, only: [:create]
  end 

  resources :chirps, only: [:show]

end
