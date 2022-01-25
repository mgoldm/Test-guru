Rails.application.routes.draw do

  resources :answers
  root to: 'tests#index'

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
