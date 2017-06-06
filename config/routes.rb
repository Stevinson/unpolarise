Rails.application.routes.draw do
  # Devise routes
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # Static page generated by ‘about’ method in pages controller
  get "/about", to: 'pages#about'

  get "/how_to_use", to: 'pages#how_to_use' # I'm dumb, I don't know why I didn't do this from the get go.

  get "/analytics", to: 'pages#analytics'

  get "/suggested_articles", to: "pages#suggested_articles" # We need a distinct path for this one, we're using the articles index in the admin section.

  resources :articles

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Facilitates the use of Attachinary
  mount Attachinary::Engine => "/attachinary"
end
