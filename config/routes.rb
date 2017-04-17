Rails.application.routes.draw do
  resources :messages
  # http://guides.rubyonrails.org/routing.html
  resources :categories
  # resources :contact
  root 'home#index'
end
