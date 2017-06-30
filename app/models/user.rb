class User < ApplicationRecord
    rolify
    # Include default devise modules. Others available are:
    # :omniauthable, :lockable
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable, :timeoutable

    has_many :chat_rooms, dependent: :destroy
    has_many :messages, dependent: :destroy
end
