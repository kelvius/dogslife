Rails.application.routes.draw do
  get 'users/show'
  get 'users/update'
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

  # Cart routes
  post 'cart/add', to: 'cart#add_to_cart', as: 'add_to_cart'
  get 'cart', to: 'cart#show', as: 'cart'
  delete 'cart/remove/:dog_id', to: 'cart#remove_from_cart', as: 'remove_from_cart'

  # Payment routs
  resources :payment, only: [:index]

  scope '/payment' do
    post 'create', to: 'payment#create', as: 'payment_create'
    get 'success', to: 'payment#success', as: 'payment_success'
    get 'cancel', to: 'paymeny#cancel', as: 'payment_cancel'
  end

    # User routes
    resources :users, only: [:show, :edit, :update]

  # Active Admin Routes
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Dog Routes
  resources :dogs, only: [:index, :show]do
  post 'add_to_cart', on: :member
end

  # You can define the root path route if needed
  root to: 'home#index'
end
