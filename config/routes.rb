Rails.application.routes.draw do
  devise_for :users
  root  'words#index'
  resources :words, only: %i[index new create show edit update destroy]
end
