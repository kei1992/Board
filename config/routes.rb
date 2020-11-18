Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  root to: 'boards#index'
  resources :updatesnew, only:[:index]
  namespace :admin do
    resources :updates, only:[:new,:create]
  end
  resources :favorites, only:[:show, :create, :destroy]
  resources :notifications, only:[:index]
  resources :boards, only:[:index,:new, :create,:edit,:update, :destroy] do
    resources :tasks do
      resources :comments, only:[:index,:new ,:create, :update, :destroy]
    end
  end

  resources :accounts, only: [:show] do
    resources :follows, only: [:create]
    resources :unfollows, only: [:create]
  end

  resource :profile, only:[:show, :edit, :update]
  resources :users
  resources :rooms
end
