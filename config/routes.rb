Rails.application.routes.draw do

  devise_for :users, path: :gurus, path_name: { sign_in: :login, sign_out: :logout }

  get 'sessions/new'

  root to: 'tests#index'

  resources :gists, only: :create

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :result, only: %i[show update] do
    member do
      get :user_result
    end
  end

  namespace :admin do
    get '/gists', to: "gists#index"

    resources :tests do
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
