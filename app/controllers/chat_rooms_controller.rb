class ChatRoomsController < ApplicationController
    before_action :authenticate_user

    def index
        @chat_rooms = ChatRoom.all
    end

    def new
        @chat_room = ChatRoom.new
    end

    def create
        @chat_room = @current_user.chat_rooms.build(chat_room_params)
        if @chat_room.save 
            flash[:notice] = 'Chat room added!'
            redirect_to @chat_room
        else
            flash[:notice] = 'Did Not Save'
            redirect_to root_path
        end
    end

    def show
        @chat_room = ChatRoom.includes(:messages).find_by(id: params[:id])
        @message = Message.new
    end

    private

    def chat_room_params
        params.require(:chat_room).permit(:title, :subscriber_id)
    end
end
