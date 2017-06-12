Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # Devise routes
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # Static page generated by ‘about’ method in pages controller
  get "/about", to: 'pages#about'

  get "/how_to_use", to: 'pages#how_to_use'

  get "/analytics", to: 'pages#analytics'

  get "/disclaimer", to: 'pages#disclaimer'

  # get "/suggested_articles", to: "pages#suggested_articles" # We need a distinct path for this one, we're using the articles index in the admin section.

  # Article
  resources :articles, only: [:show] # All the other actions are managed through Rails Admin (index, new, create, update, delete)
  get 'suggested_articles', to: 'articles#index', as: 'suggested_articles'

  resources :users, only: [:show]

  #Logged out Home Page
  root to: 'pages#home'

  # The links controller needs to have an action that receives the post requests from the extension
  resources :links, only: [:create]

  # Facilitates the use of Attachinary
  mount Attachinary::Engine => "/attachinary"
end
