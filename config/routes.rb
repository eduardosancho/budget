Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'sessions', registrations: 'registrations'}
  devise_scope :user do
    authenticated :user do
      root "categories#index", as: :authenticated_root
    end
    unauthenticated do
      root 'users/splash/', as: :unauthenticated_root, action: :new_splash, controller: 'categories'
    end
  end
  
  resources :categories
  resources :operations, only: [:index, :new, :create, :show]
  
  get 'categories/:category_id/operations/new_two', as: 'new_transaction', action: :new_two, controller: :operations
  post 'categories/:category_id/operations', as: 'create_transaction', action: :create_two, controller: :operations
end
