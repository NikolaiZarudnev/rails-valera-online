Rails.application.routes.draw do
  get 'home/index'

  #get 'valera_actions/index'
  resource :valera_actions do
    resources :conditions
  end
  resource :session
  resources :users do
    resources :states
  end

  root 'home#index'
end
