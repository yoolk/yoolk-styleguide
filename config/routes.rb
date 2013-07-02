YoolkStyleguide::Engine.routes.draw do
  root to: 'home#index'

  resources :base_css, only: [ :index ]
  resources :components, only: [ :index ]
end