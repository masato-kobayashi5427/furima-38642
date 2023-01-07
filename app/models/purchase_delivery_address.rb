class PurchaseDeliveryAddress
  include ActiveModel::Model
  attr_accessor :user_id, :product_id, :zipcode, :prefecture_id, :city, :region, :building, :telephone, :token

  with_options presence: true do
    validates :zipcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "は半角英数字で入力してください"}
    validates :prefecture_id, numericality: { other_than: 1 , message: "を入力してください"}
    validates :user_id, :product_id, :city, :region, :token
    validates :telephone, numericality: true, format: { with: /\A[0-9]+\z/, message: "は半角英数字で入力してください" }, length: { minimum: 10, maximum: 11 }
  end

  def save
    purchase = Purchase.create(user_id: user_id, product_id: product_id)
    DeliveryAddress.create(zipcode: zipcode, prefecture_id: prefecture_id, city: city, region: region, building: building, telephone: telephone, purchase_id: purchase.id)
  end
end