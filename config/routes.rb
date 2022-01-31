Rails.application.routes.draw do

  get 'sessions/new'
  resources :answers
  root to: 'tests#index'

  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'


  resources :users, only: :create
  resources :sessions, only: %i[create destroy]

  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true
    end

    member do
      post :start
    end
  end

  resources :result, only: %i[show update] do
    member do
      get :user_result
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
