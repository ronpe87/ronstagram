Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'photos#index'

  resources :photos do
    resources :comments, only: [:index, :new, :create]
    resource :like, only: [:create, :destroy]
  end

  resource :timeline, only: [:show]

  resource :profile, only: [:show, :update]
end
