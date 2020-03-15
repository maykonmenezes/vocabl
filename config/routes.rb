Rails.application.routes.draw do
  devise_for :users
  root  'words#index'
  resources :words, only: %i[index new create show edit update destroy]
  resources :games, only: %i[new create show]
  resources :answers, only: %i[create]
end
