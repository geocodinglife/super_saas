Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :users, only: %i[index show] do
    patch :resend_invitation, on: :member
  end

  resources :tenants do
    get :my, on: :collection
  end


  resources :members do
    get :invite, on: :collection
  end
end
