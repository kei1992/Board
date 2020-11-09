Rails.application.routes.draw do
  get 'hello_world', to: 'hello_world#index'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'boards#index'
  resources :boards do
    resource :bookmark,only:[:show,:create, :destroy]
    resources :tasks do
      resource :archive,only:[:show,:create, :destroy]
      resources :comments, only:[:index,:new ,:create, :update, :destroy]
    end
  end

  resources :accounts, only: [:show] do
    resources :follows, only: [:create]
    resources :unfollows, only: [:create]
  end
  resource :profile, only:[:show, :edit, :update]
  resources :mybookmarks, only:[:index]
end
