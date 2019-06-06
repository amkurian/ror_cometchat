Rails.application.routes.draw do
  resources :users, only: %i[index show]

  root 'users#index'
end