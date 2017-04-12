Rails.application.routes.draw do
  # http://guides.rubyonrails.org/routing.html
  resources :categories
  # resources :contact
  root 'home#index'
end
