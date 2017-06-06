Rails.application.routes.draw do
  # Devise routes
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # Static page generated by ‘about’ method in pages controller
  get "/about", to: 'pages#about'

  get "/howtouse", to: 'pages#howtouse'

  # Give access to Analytics and Suggested Articles
  resources :users, only: [:show] do
    resources :articles, only: [:index]
  end

  resources :articles, only: [:show, :new, :create, :update, :edit, :destroy]

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
