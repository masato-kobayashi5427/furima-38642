class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  
  def index
    @products = Product.order("created_at DESC")
    @q = Product.ransack(params[:q])
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
    @comments = @product.comments.includes(:user)
    @comment = Comment.new
    @q = Product.ransack(params[:q])
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

  def searchkey
    # params[:q]がnilではない且つ、params[:q][:name]がnilではないとき（商品名の欄が入力されているとき）
    # if params[:q] && params[:q][:name]と同じような意味合い
    if params[:q]&.dig(:name)
      # squishメソッドで余分なスペースを削除する
      squished_keywords = params[:q][:name].squish
      ## 半角スペースを区切り文字として配列を生成し、paramsに入れる
      params[:q][:name_cont_any] = squished_keywords.split(" ")
    end
    @q = Product.ransack(params[:q])
    @products = @q.result
  end

  def search
    return nil if params[:keyword] == ""
    tag = Tag.where(['tag_name LIKE ?', "%#{params[:keyword]}%"] )
    render json:{ keyword: tag }
  end

  private

  def product_form_params
    params.require(:product_form).permit(:name, :explain, :price, :category_id, :prefecture_id, :state_id, :fee_id, :delivery_time_id, :tag_name, {images: []}).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end

