class ChatRoom < ApplicationRecord
    resourcify
    belongs_to :user
    has_many :messages, dependent: :destroy
    validates :title, :presence => true

    def self.search(search)
        where("title LIKE ?", "%#{search}%")
    end
end
