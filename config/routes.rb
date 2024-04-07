Rails.application.routes.draw do
  get 'home/index'
  # Health Check Route
  get "up" => "rails/health#show", as: :rails_health_check

  #Route for static pages
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  # Specify the controller for the user routes
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    sign_up: 'register'
  }



  # Active Admin Routes
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Dog Routes
  resources :dogs, only: [:index, :show]

  # You can define the root path route if needed
  root to: 'home#index'
end
