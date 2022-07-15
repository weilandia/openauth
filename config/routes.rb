# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users, only: [:index]

  namespace :admin do
    resources :users, only: [:index]
  end
end
