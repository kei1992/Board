Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'boards#index'
  resources :boards do
    resource :bookmark,only:[:show,:create, :destroy]
    resources :tasks do
      resources :comments, only:[:index,:new ,:create, :update, :destroy]
    end
  end
  resource :profile, only:[:show, :edit, :update]
  resources :mybookmarks, only:[:index]
end
