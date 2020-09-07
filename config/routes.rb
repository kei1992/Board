Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'boards#index'
  resources :boards do
    resources :tasks do
      resources :comments, only:[:new ,:create, :update, :destroy]
    end
  end
  resources :profile, only:[:show, :edit, :update]
end
