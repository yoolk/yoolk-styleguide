YoolkStyleguide::Engine.routes.draw do
  root to: 'home#index'

  resources :css, only: [ :index ]
  resources :components, only: [ :index ]
end