# frozen_string_literal: true

Rails.application.routes.draw do
  mount RateIt::Engine => '/rate_it'
  resources :rateable do
    member do
      put :rate_it
    end
  end
  # Add your own routes here, or remove this file if you don't have need for it.
end
