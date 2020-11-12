Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'hello_world', to: 'hello_world#index'

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  root to: 'boards#index'
  resources :favorites, only:[:create, :destroy]
  resources :boards do
    resource :bookmark,only:[:show,:create, :destroy]
    resources :tasks do
      resources :comments, only:[:index,:new ,:create, :update, :destroy]
    end
  end

  resources :accounts, only: [:show] do
    resources :follows, only: [:create]
    resources :unfollows, only: [:create]
  end
  resource :profile, only:[:show, :edit, :update]
  resources :mybookmarks, only:[:index]

  resources :users
  resources :rooms
end
