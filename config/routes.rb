Rails.application.routes.draw do
  devise_for :users
  resources :videos, only: %i[new create show update destroy]
  get 'videos/edit/:url', to: 'videos#edit', as: :edit_video
  patch 'videos/views/:id', to: 'videos#increase_views'
  root to: 'pages#home'
end
