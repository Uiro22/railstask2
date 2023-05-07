class RoomsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_q
  
    def index
    end
  
    def new
        @room = Room.new
    end
  
    def create
        @room = current_user.rooms.build(room_params)
    if @room.valid?(:create) && @room.save
        flash[:notice] = "登録が完了しました"
        redirect_to rooms_path
    else
        flash[:alert] = "登録できませんでした"
        render :new
      end
    end
  
    def show
        @room = Room.find(params[:id])
        @reservation = Reservation.new
    end
  
    def search
        @results = @q.result
    end
  
    private
  
    def room_params
        params.require(:room).permit(:name, :description, :price, :address, :room_img)
    end
  
    def set_q
        @q = Room.ransack(params[:q])
    end
  end
  