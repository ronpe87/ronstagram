Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'photos#index'

  resources :photo, only: [:show]
  resource :timeline, only: [:show]

  resource :profile, only: [:show, :update]
end
