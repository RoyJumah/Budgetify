Rails.application.routes.draw do
  devise_for :users

  root to: 'users#index'
  resources :users, only: %i[index show] do
    resources :entities, only: %i[index show]
    resources :groups, only: %i[index show]
  end
end
