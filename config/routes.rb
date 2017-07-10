Rails.application.routes.draw do
  devise_for :users

  resources :messages
  resources :chat_rooms do
      collection do
          get 'mine'
          get 'admin'
      end
  end

  root 'chat_rooms#index'

  mount ActionCable.server => '/cable'
end
