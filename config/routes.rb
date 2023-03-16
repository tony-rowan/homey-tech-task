# frozen_string_literal: true

Rails.application.routes.draw do
  root "projects#index"

  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  resources :projects, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :comments, only: [:new, :create]
end
