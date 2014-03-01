Randompocket::Application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  as :user do
    delete 'signout' => 'devise/sessions#destroy', as: :destroy_user_session
  end

  mount Resque::Server, at: "/resque"

  root to: 'root#index'

  get :viewer, to: 'root#viewer'
  get :dashboard, to: 'admin#dashboard'

  resources :users, only: %[] do
    collection do
      get :fetching
    end
  end

  resources :articles, only: %[] do
    collection do
      get :random
    end

    member do
      post :favorite
      post :archive
    end
  end
end
