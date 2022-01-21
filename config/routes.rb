Rails.application.routes.draw do
  get 'home/index'

  # get 'valera_actions/index'
  resources :valera_actions do
    resources :conditions
  end

  resource :session
  resources :users do
    resources :valera_actions
  end
  resources :stats_records
  # resource :user do
  #  resource :stats_record
  # end
  root 'home#index'
end
