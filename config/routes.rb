Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "products#index"

  resources :products do
    member do
      post :like
      post :unlike 
    end

    resources :comments, only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit, :update]
end
