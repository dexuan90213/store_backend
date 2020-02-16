Rails.application.routes.draw do
  devise_for :managers
  namespace :admin do
    resources :products do
      member do
        delete "delete_image/:image_id", action: :delete_image
      end
    end
    root 'products#index'
  end

  root 'admin/products#index'
end
