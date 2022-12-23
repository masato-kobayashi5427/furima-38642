class PurchasesController < ApplicationController
  before_action :authenticate_user!, expect: :index
  
  def index
    @purchase_delivery_address = PurchaseDeliveryAddress.new
    @product = Product.find(params[:product_id])
    if @product.purchase.blank? && current_user.id != @product.user_id
    else
      redirect_to root_path
    end
  end

  def create
    @purchase_delivery_address = PurchaseDeliveryAddress.new(purchase_params)
    @product = Product.find(params[:product_id])
    if @purchase_delivery_address.valid?
      pay_item
      @purchase_delivery_address.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_params
    params.require(:purchase_delivery_address).permit(:zipcode, :prefecture_id, :city, :region, :building, :telephone).merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @product.price,  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end