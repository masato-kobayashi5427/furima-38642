Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'
  resources :products do
    resources :purchases, only: [:index, :create]
    resources :comments, only: :create
    collection do
      get 'search'
      get 'searchkey'
    end
  end
end
