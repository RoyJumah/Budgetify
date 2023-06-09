Rails.application.routes.draw do
  get 'group/expenses'
  devise_for :users
  resources :groups
  resources :groups_assets, only: [:new, :create]
  resources :assets
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


  devise_scope :user do
    authenticated :user do
      root 'groups#index', as: :authenticated_root
    end
  
    unauthenticated do
      root 'welcome#index', as: :unauthenticated_root
    end
  end
  

  # Defines the root path route ("/")

  get '/older_groups' => "groups#older_index"
end