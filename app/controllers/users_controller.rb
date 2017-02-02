class UsersController < ApplicationController
  def update
    if current_user.update(user_params)
      respond_to do |format|
        format.json { render json: current_user }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:location_string)
  end
end
