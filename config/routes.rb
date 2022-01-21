Rails.application.routes.draw do
  get 'home/index'

  #get 'valera_actions/index'
  resources :valera_actions do
    resources :conditions
  end
  resource :session
  resources :users do
    resources :valera_actions
  end
  root 'home#index'
end
