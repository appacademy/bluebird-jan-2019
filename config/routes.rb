Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    resources :chirps, only: [:index, :create]
  end

  root to: 'static_pages#root'
end
