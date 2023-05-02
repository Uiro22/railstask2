class HomeController < ApplicationController
    before_action :set_q, only: [:index]

    def index
        @user = current_user
    end
  
    private
  
    def set_q
        @q = Room.ransack(params[:q])
    end
  
  end
