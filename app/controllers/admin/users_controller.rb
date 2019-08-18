class Admin::UsersController < Admin::BaseController

  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "刪除成功"
    redirect_back(fallback_location: root_path)
  end
end
