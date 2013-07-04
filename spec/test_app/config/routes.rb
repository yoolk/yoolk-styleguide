TestApp::Application.routes.draw do
  mount YoolkStyleguide::Engine, at: '/styleguide' unless Rails.env.production?
end