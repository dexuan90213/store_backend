Rails.application.routes.draw do
  devise_for :managers
  namespace :admin do
    resources :products
    root 'products#index'
  end

  root 'admin/products#index'
end
