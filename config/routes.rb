Rails.application.routes.draw do
  root to: 'room#show'

  mount ActionCable.server => '/cable'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  resources :categories
end
