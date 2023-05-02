class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_q

    def account
        @user = current_user
    end

    def profile
        @user = current_user
    end

    def update
        @user = User.find(params[:id])
    if @user.update(profile_params)
        flash[:notice] = "更新しました"
        redirect_to users_profile_path
    else
        flash.now[:alert] = "更新失敗しました、再入力してください"
        render users_profile_path
      end
  end

    def set_q
        @q = Room.ransack(params[:q])
    end

    private

    def profile_params
        params.require(:user).permit(:profile_image_id, :username, :profile)
    end

    def set_q
        @q = Room.ransack(params[:q])
    end

end
