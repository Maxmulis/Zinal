Rails.application.routes.draw do
  get 'people/create'
  get 'people/edit'
  get 'people/update'
  root to: 'groups#index'
  devise_for :users
  resources :groups, only: [ :index, :create, :show ]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
