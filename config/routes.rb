Rails.application.routes.draw do

  get 'dashboard/index'

  devise_for :users, controller: {
    registrations: 'users/registrations'  
  }

  resources :companies do
  	resources :claims, only: [:create, :destroy]
  end

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'companies#index'
end
