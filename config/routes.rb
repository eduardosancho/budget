Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root "categories#index", as: :authenticated_root
    end
    unauthenticated do
      root 'users/splash/', as: :unauthenticated_root, action: :new_splash, controller: 'categories'
    end
  end
end
