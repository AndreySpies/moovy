Rails.application.routes.draw do
  devise_for :users
  resources :videos, only: %i[new create show edit update destroy]
  root to: 'pages#home'
end
