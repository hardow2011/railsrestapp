Rails.application.routes.draw do
  
  resources :pictures
  resources :registries
  resources :users
  
  root 'users#index'
  get'users/list_registries/:id', to: 'users#list_registries', as: 'list_registries_user'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
