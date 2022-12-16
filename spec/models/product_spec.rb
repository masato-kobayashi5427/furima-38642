require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end
  describe '出品登録' do
    context '出品できる場合' do
      it '入力に問題がない場合' do
        expect(@product).to be_valid
      end
    end
    context '出品できない場合' do
      it 'nameが空では出品できない' do
        @product.name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
      it 'imageが空では出品できない' do
        @product.image =  nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it 'explainが空では出品できない' do
        @product.explain = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Explain can't be blank")
      end
      it 'priceが空では出品できない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
      it 'category_idが---では出品できない' do
        @product.category_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end
      it 'prefecture_idが---では出品できない' do
        @product.prefecture_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'state_idが---では出品できない' do
        @product.state_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include("State can't be blank")
      end
      it 'fee_idが---では出品できない' do
        @product.fee_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include("Fee can't be blank")
      end
      it 'delivery_time_idが---では出品できない' do
        @product.delivery_time_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery time can't be blank")
      end
      it 'priceが299以下だと出品できない' do
        @product.price = '299'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it 'priceが10000000以上だと出品できない' do
        @product.price = '10000000'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it 'priceが全角数字だと出品できない' do
        @product.price = '１０００'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not a number")
      end
      it 'ユーザーが紐付いていなければ出品できない' do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include('User must exist')
      end
    end
  end
end
