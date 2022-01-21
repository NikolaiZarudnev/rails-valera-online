Rails.application.routes.draw do
  get 'home/index'

  resources :valera_actions do
    resources :conditions
  end
  resource :session
  resources :valera_actions
  resources :users
  resources :stats_records

  root 'home#index'
end
