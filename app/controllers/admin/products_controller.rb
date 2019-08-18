class Admin::ProductsController < Admin::BaseController
  
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
