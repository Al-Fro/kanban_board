Rails.application.routes.draw do
  require 'sidekiq/web'
  
  mount Sidekiq::Web => '/sidekiq' if Rails.env.development?

  root to: 'boards#new'

  resources :boards, only: %i[create show] do
    resources :lists, only: %i[create destroy] do
      resources :cards, only: %i[create update destroy]
    end
  end
end
