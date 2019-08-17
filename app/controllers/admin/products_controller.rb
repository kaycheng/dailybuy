class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin

  def index
    @products = Product.all.includes(:user)
  end

  def destroy
    @product = Product.find_by(params[:id])
    @product.destroy
    flash[:notice] = "刪除成功"
    redirect_back(fallback_location: root_path)
  end
end
