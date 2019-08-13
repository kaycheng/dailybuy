class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :show, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    @product.user = current_user
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save
      redirect_to user_path(current_user), notice: "新增成功"
    else
      render "new", notice: "There are some errors."
    end
  end

  def edit
    unless current_user == @product.user
      redirect_to products_path, notice: "Not allow"
    end
  end

  def update
    @product.user = current_user
    if @product.update(product_params)
      redirect_to user_path(current_user), notice: "修改成功"
    else
      render "edit", notice: "There are some errors."
    end  
  end

  def destroy
    @product.user = current_user
    @product.destroy
    redirect_to user_path(current_user), notice: "刪除成功"
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :price, :photo, :current_user)
  end

  def set_product
    @product = Product.find_by(id: params[:id])
  end
end
