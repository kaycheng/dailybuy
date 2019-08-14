class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to product_path(@product), notice: "Great!"
  end

  def destroy
    @product = Product.find(params[:product_id])
    @comment = Comment.find(params[:id])

    if current_user == @product.user
      @comment.destroy
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
