Rails.application.routes.draw do
  resources :projects do
    resources :tasks, shallow: true
  end
  resources :comments
  resources :notifications, only: [:index] do
    member do
      patch :mark_as_read
    end
  end
  resource :session
  resources :passwords, param: :token

  get "dashboard", to: "dashboard#show"

  get "up" => "rails/health#show", as: :rails_health_check

  root "dashboard#show"
end
