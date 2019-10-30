Rails.application.routes.draw do
  root :to => 'static#home'
  get '/team', to: 'static#team'
  get '/contact', to: 'static#contact'
  get 'welcome/:first_name', to: 'dynamic#welcome', as: 'welcome_first_name'
  get 'home/:id', to: 'dynamic#user', as: 'user'
  
  resources :gossips
  resources :cities
end
