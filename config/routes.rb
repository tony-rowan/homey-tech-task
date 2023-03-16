# frozen_string_literal: true

Rails.application.routes.draw do
  root "root#show"

  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
end
