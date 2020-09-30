Rails.application.routes.draw do
  # devise_for :users
  # controllers: {
  #   sessions: 'devise/sessions',
  #   registrations: "devise/registrations",
  #   omniauth_callbacks: 'users/omniauth_callbacks'
  # }
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'boards#index'
  resources :boards do
    resource :bookmark,only:[:show,:create, :destroy]
    resources :tasks do
      resource :archive,only:[:create, :destroy]
      resources :comments, only:[:index,:new ,:create, :update, :destroy]
    end
  end
  resource :profile, only:[:show, :edit, :update]
  resources :mybookmarks, only:[:index]
end
