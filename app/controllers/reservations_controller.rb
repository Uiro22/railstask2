class ReservationsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_q

    def index
        @user = current_user
        @reservations = current_user.reservations
    end

    def new
        @user = current_user
        @reservation = Reservation.new(reservation_params)
        @room = Room.find(params[:reservation][:room_id])
    if @reservation.invalid?
        flash.now[:alert] = "予約情報が不足しています"
        render template: 'rooms/show'
    else
        flash.now[:alert] = "予約はまだ確定していません"
    end
end

    def create
        @user = current_user
        @reservation = Reservation.new(reservation_params)
        @reservation.user_id = current_user.id
    if @reservation.save
        flash[:notice] = "予約が完了しました"
        redirect_to reservation_path(@reservation)
    end
end

    def show
        @user = current_user
        @reservation = Reservation.find(params[:id])
    end

    private

    def reservation_params
        params.require(:reservation).permit(:start_date, :end_date, :number, :user_id, :room_id)
    end

    def set_q
        @q = Room.ransack(params[:q])
    end
end
