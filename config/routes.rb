Rails.application.routes.draw do
  root :to => 'static#home'
  get '/team', to: 'static#team'
  get '/contact', to: 'static#contact'
  get 'welcome/:first_name', to: 'dynamic#welcome'
  get 'home/:id', to: 'dynamic#gossip'
  get 'home/user/:first_name', to: 'dynamic#gossip'
end
