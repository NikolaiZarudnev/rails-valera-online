Rails.application.routes.draw do
  get 'home/index'

  #get 'valera_actions/index'
  resources :valera_actions do
    resources :conditions
  end
  resource :session
  resources :users
  root 'home#index'
end
