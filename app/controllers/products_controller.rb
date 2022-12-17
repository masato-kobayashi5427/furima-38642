class ProductsController < ApplicationController
  before_action :authenticate_user!, only: :new
  
  def index
    @products = Product.order("created_at DESC")
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(:name, :explain, :price, :category_id, :prefecture_id, :state_id, :fee_id, :delivery_time_id, :image).merge(user_id: current_user.id)
  end
end

