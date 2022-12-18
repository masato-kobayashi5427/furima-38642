class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, except: [:index, :show, :new, :create, :destroy]
  
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
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to "/products/#{@product.id}"
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to action: :index
  end

  private

  def product_params
    params.require(:product).permit(:name, :explain, :price, :category_id, :prefecture_id, :state_id, :fee_id, :delivery_time_id, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    if current_user.id != @product.user_id
      redirect_to action: :index
    end
  end

  def set_product
    @product = Product.find(params[:id])
  end
end

