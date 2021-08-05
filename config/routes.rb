Rails.application.routes.draw do
  root to: 'boards#new'

  resources :boards, only: %i[create show] do
    resources :lists, only: %i[create destroy] do
      resources :cards, only: %i[create update destroy]
    end
  end
end
