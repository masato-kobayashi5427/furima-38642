class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  
  def index
    @products = Product.order("created_at DESC")
  end

  def new
    @product_form = ProductForm.new
  end

  def create
    @product_form = ProductForm.new(product_form_params)
    if @product_form.valid?
      @product_form.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    product_attributes = @product.attributes
    @product_form = ProductForm.new(product_attributes)
    @product_form.tag_name = @product.tags.first&.tag_name
    if @product.purchase.present? || current_user.id != @product_form.user_id
      redirect_to root_path
    else
    end
  end

  def update
    @product_form = ProductForm.new(product_form_params)

    @product_form.images ||= @product.images
    if @product_form.valid?
      @product_form.update(product_form_params, @product)
      redirect_to "/products/#{@product_form.id}"
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to action: :index
  end

  private

  def product_form_params
    params.require(:product_form).permit(:name, :explain, :price, :category_id, :prefecture_id, :state_id, :fee_id, :delivery_time_id, :tag_name, {images: []}).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end

