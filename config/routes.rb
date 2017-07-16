Rails.application.routes.draw do
    devise_for :users

    resources :chat_rooms do
        collection do
            get 'mine'
            get 'users'
            get 'salons'
            post 'destroy_user'
        end
    end

    resources :users_extend, :path => 'users', param: :id, only: [:destroy]
    

    root 'chat_rooms#index'

    mount ActionCable.server => '/cable'
end
