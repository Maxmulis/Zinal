Rails.application.routes.draw do
  root to: 'groups#index'
  devise_for :users
  resources :groups, only: [ :index, :create, :show, :edit, :update ] do
    resources :people, only: [ :new, :create ]
  end
  resources :people, only: [ :index, :edit, :update ]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
