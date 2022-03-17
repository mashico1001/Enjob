class UsersController < ApplicationController

  def index #ランキング用
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to tasks_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :image)
  end

end
