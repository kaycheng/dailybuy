class UsersController < ApplicationController
  before_action :set_user

  

  def edit
    unless current_user == @user
      redirect_to user_path(@user), notice: "Not allow"
    end
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "修改完成"
    else
      render edit_user_path(@user), notice: "出現錯誤"
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :avatar)
  end

end
