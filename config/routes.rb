# frozen_string_literal: true

require 'api_constraints'

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    # mount_devise_token_auth_for "User", at: "auth"

    mount_devise_token_auth_for 'User', at: 'auth', controllers: {
      sessions: 'overrides/sessions'
    }

    scope module: :v1,
          constraints: ApiConstraints.new(version: 1, default: false) do
      resources :articles
      resources :profiles, only: %i[create update index show destroy edit new]
    end

    scope module: :v2,
          constraints: ApiConstraints.new(version: 2, default: true) do
      resources :articles
      resources :menus
    end
  end
end
