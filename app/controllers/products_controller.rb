class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :show, :update, :destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path, notice: "新增成功"
    else
      render "new", notice: "There are some errors."
    end
  end

  def update
    if @product.update(product_params)
      redirect_to products_path, notice: "修改成功"
    else
      render "edit", notice: "There are some errors."
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path, notice: "刪除成功"
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :price, :photo)
  end

  def set_product
    @product = Product.find_by(id: params[:id])
  end

end
