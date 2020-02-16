Rails.application.routes.draw do
  devise_for :managers

  root 'products#index'
  resources :products, only: [:index, :show]

  namespace :admin do
    resources :products do
      member do
        delete "delete_image/:image_id", action: :delete_image
      end
    end
    root 'products#index'
  end
end
