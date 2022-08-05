Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :purchases, only: [:index, :new, :create]
  end

  resources :cards, only:[:index, :new, :create, :destroy, :show] do
    member do
      post 'pay'
    end
  end
  
end
