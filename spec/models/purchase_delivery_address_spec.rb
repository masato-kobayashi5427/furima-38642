require 'rails_helper'

RSpec.describe PurchaseDeliveryAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @product = FactoryBot.create(:product)
    @purchase_delivery_address = FactoryBot.build(:purchase_delivery_address, user_id: @user.id, product_id: @product.id)
    sleep 0.1
  end

  describe '商品購入機能' do
    context '購入できる場合' do
      it '入力に問題がない' do
        expect(@purchase_delivery_address).to be_valid
      end
      it 'buildingが空でも購入ができる' do
        @purchase_delivery_address.building = ''
        expect(@purchase_delivery_address).to be_valid
      end
    end
    context '購入できない場合' do
      it 'prefecture_idが---では購入ができない' do
        @purchase_delivery_address.prefecture_id = '1'
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'user_idが空では購入ができない' do
        @purchase_delivery_address.user_id = ''
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include("User can't be blank")
      end
      it 'product_idが空では購入ができない' do
        @purchase_delivery_address.product_id = ''
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include("Product can't be blank")
      end
      it 'tokenが空では購入ができない' do
        @purchase_delivery_address.token = ''
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'zipcodeが空では購入ができない' do
        @purchase_delivery_address.zipcode = ''
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include("Zipcode can't be blank")
      end
      it 'zipcodeがハイフン無しでは購入ができない' do
        @purchase_delivery_address.zipcode = '1234567'
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include("Zipcode is invalid")
      end
      it 'zipcodeが全角では購入ができない' do
        @purchase_delivery_address.zipcode = '１２３ー４５６７'
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include("Zipcode is invalid")
      end
      it 'cityが空では購入ができない' do
        @purchase_delivery_address.city = ''
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include("City can't be blank")
      end
      it 'regionが空では購入ができない' do
        @purchase_delivery_address.region = ''
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include("Region can't be blank")
      end
      it 'telephoneが空では購入ができない' do
        @purchase_delivery_address.telephone = ''
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include("Telephone can't be blank")
      end
      it 'telephoneが全角では購入ができない' do
        @purchase_delivery_address.telephone = '０００ー００００'
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include("Telephone is invalid. only half size number")
      end
      it 'telephoneが9桁以下では購入ができない' do
        @purchase_delivery_address.telephone = '000000000'
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include("Telephone is invalid. only half size number")
      end
    end
  end
end