Rails.application.routes.draw do
  resources :members
  devise_for :users
  root 'home#index'
  resources :users, only: %i[index show]

  resources :tenants do
    get :my, on: :collection
  end
end
