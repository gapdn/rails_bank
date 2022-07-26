# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for(:users, only: %i[sessions registrations])

  root to: 'accounts#index'

  resources :accounts, except: %i[destroy update]
  resources :account_transactions, only: %i[index show new create]
end
