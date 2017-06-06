Rails.application.routes.draw do
  devise_for :users
  resources :messages
  # http://guides.rubyonrails.org/routing.html
  resources :categories
  # resources :contact
  root 'categories#index'
end
