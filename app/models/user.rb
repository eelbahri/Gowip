class User < ApplicationRecord
    rolify
    # Include default devise modules. Others available are:
    # :omniauthable, :lockable
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable, :timeoutable

    has_many :chat_rooms, dependent: :destroy
    has_many :messages, dependent: :destroy
    after_create :assign_default_role

    def assign_default_role
        self.add_role(:simple_user) if self.roles.blank?
    end
end
