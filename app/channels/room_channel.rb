# Be sure to restart your server when you modify this file.
# Action cable runs in an eventmachine loop that does not support auto reloading.

class RoomChannel < ApplicationCable::Channel
    def subscribed
        stream_from "room-channel"
    end

    def unsubscribed
        # Any cleanup needed when channel is unsubscribed
    end

    def speak(data)
        Message.create! content: data['message']
    end
end
