class ProductForm
  include ActiveModel::Model

  attr_accessor(
    :images, :name, :explain, :price, :category_id, :prefecture_id, :state_id,
    :fee_id, :delivery_time_id, :user_id, :id, :created_at, :updated_at
  )

  validates :images, presence: true
  validates :images, length: { minimum: 1, maximum: 5, message: "は1枚以上5枚以下にしてください" }
  validates :name, presence: true
  validates :explain, presence: true
  NUM_HANKAKU = /\A[0-9]+\z/.freeze
  validates_format_of :price, with: NUM_HANKAKU, message: 'は半角数字で入力してください'
  validates :price, presence: true
  validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :category_id, numericality: { other_than: 1 , message: "を入力してください"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "を入力してください"}
  validates :state_id, numericality: { other_than: 1 , message: "を入力してください"}
  validates :fee_id, numericality: { other_than: 1 , message: "を入力してください"}
  validates :delivery_time_id, numericality: { other_than: 1 , message: "を入力してください"}

  def save 
    Product.create(user_id: user_id, images: images, name: name, explain: explain, price: price, category_id: category_id, prefecture_id: prefecture_id, state_id: state_id, fee_id: fee_id, delivery_time_id: delivery_time_id )
  end

  def update(params, product)
    product.update(params)
  end
end