Rails.application.routes.draw do
  get 'people/index'
  devise_for :users
  root to: 'pages#home'
  resources :groups, :people
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
