Rails.application.routes.draw do
  root to: 'groups#index'
  devise_for :users
  resources :people, only: [ :edit, :update, :show, :create]
  resources :groups, only: [ :index, :create, :show ]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
