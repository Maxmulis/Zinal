Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :groups, only: [ :index, :create, :show, :edit, :update ] do
    get 'people', to: 'people#people', as: 'people'
    resources :people, only: [ :new, :create ]

  end
  resources :people, only: [ :index, :edit, :update, :show ]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
