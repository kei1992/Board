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

  def after_new_user_registration_path_for(resource)
    profile_path(resource)
  end

  root to: 'boards#index'
  resources :favorites, only:[:show, :create, :destroy]
  resources :notifications, only:[:index]
  resources :boards, only:[:index,:new, :create,:edit,:update, :destroy] do
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
