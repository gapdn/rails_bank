# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :users, except: %i[destroy index]

  # Defines the root path route ("/")
  # root "articles#index"
end
