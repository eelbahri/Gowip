class ChatRoomsController < ApplicationController
    before_action :chat_rooms_search, only: [:index, :salons]
    load_and_authorize_resource

    def index
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
        if ChatRoom.exists?(title: @chat_room.title)
            flash[:danger] = "Ce salon existe déjà"
            redirect_to chat_rooms_path
        else
            @chat_room = current_user.chat_rooms.build(chat_room_params)
            if @chat_room.save
                flash[:success] = "Le salon a bien été crée"
                redirect_to chat_rooms_path
            else
                render 'new'
            end
        end
    end

    def users
        if params[:search]
            @users = User.search(params[:search]).order("id DESC").paginate(:page => params[:page], per_page: 10);
        else
            @users = User.all.order("id DESC").paginate(:page => params[:page], per_page: 10);
        end
        render :users
    end

    def salons
        render :salons
    end

    def edit
        session[:return_to] ||= request.referer
    end

    def update
        if @chat_room.update chat_room_params
            flash[:success] = "Le salon \"#{@chat_room.title}\" a bien été modifié."
            redirect_to session.delete(:return_to)
        else
            render 'edit'
        end
    end

    def destroy_user
        # flash[:success] = "L'utilsateur \"#{@user.username}\" a bien été supprimé."
        @user.destroy
        redirect_to users_chat_rooms_path
    end

    def destroy
        flash[:success] = "Le Salon \"#{@chat_room.title}\" a bien été supprimé."
        @chat_room.destroy
        redirect_to salons_chat_rooms_path
    end

    private

    def chat_room_params
        params.require(:chat_room).permit(:title)
    end

    def chat_rooms_search
        if params[:search]
            @chat_rooms = ChatRoom.search(params[:search]).order("created_at DESC").paginate(:page => params[:page], per_page: 10);
        else
            @chat_rooms = ChatRoom.all.order("created_at DESC").paginate(:page => params[:page], per_page: 10);
        end
    end
end
