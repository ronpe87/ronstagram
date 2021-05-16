require 'sidekiq/web'

Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  mount Sidekiq::Web => '/sidekiq' if Rails.env.development?

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'photos#index'

  resource :timeline, only: [:show]

  resources :accounts, only: [:show] do
    resources :followings, only: [:index]
    resources :follows, only: [:index, :show, :create]
    resources :unfollows, only: [:create]
  end

  resource :timeline, only: [:show]

  resource :profile, only: [:show, :update]

  namespace :api, defaults: {format: :json} do
    scope '/photos/:photo_id' do
      resources :comments, only: [:index, :create]
      resource :like, only: [:create, :destroy]
    end
  end
end
