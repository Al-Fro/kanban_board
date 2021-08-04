Rails.application.routes.draw do
  root to: 'boards#new'

  resources :boards, only: %i[create show]
end
