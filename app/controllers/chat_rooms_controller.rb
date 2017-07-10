class ChatRoomsController < ApplicationController

    load_and_authorize_resource

    def index
        if params[:search]
            @chat_rooms = ChatRoom.search(params[:search]).order("created_at DESC").paginate(:page => params[:page], per_page: 7)
        else
            @chat_rooms = ChatRoom.order("created_at DESC").paginate(:page => params[:page], per_page: 7)
        end
    end

    def show
        @chat_room = ChatRoom.includes(:messages).find_by(id: params[:id])
        @message = Message.new
    end

    def mine
        if params[:search]
            @chat_rooms = current_user.chat_rooms.search(params[:search]).order("created_at DESC")
        else
            @chat_rooms = current_user.chat_rooms.order("created_at DESC")
        end

        render :mine
    end

    def new
        @chat_room = ChatRoom.new
    end

    def create
        @chat_room = current_user.chat_rooms.build(chat_room_params)
        if @chat_room.save
            flash[:success] = 'Chat room added!'
            redirect_to chat_rooms_path
        else
            render 'new'
        end
    end

    def admin
        if params[:search]
            @chat_rooms = ChatRoom.search(params[:search]).order("created_at DESC").paginate(:page => params[:page], per_page: 10);
        else
            @chat_rooms = ChatRoom.all.order("created_at DESC").paginate(:page => params[:page], per_page: 10);
        end
        render :admin
    end

    def edit
    end

    def update
        if @chat_room.update chat_room_params
            flash[:success] = "Le salon #{@chat_room.title} a bien été modifié."
            redirect_to admin_chat_rooms_path
        else
            render 'edit'
        end
    end

    def destroy
        @chat_room.destroy
        redirect_to admin_chat_rooms_path
    end

    private

    def chat_room_params
        params.require(:chat_room).permit(:title)
    end
end
