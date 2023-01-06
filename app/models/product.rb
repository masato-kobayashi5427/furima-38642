class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :images, presence: true
  validates :images, length: { minimum: 1, maximum: 5, message: "は1枚以上5枚以下にしてください" }
  validates :name, presence: true
  validates :explain, presence: true
  NUM_HANKAKU = /\A[0-9]+\z/.freeze
  validates_format_of :price, with: NUM_HANKAKU, message: 'は半角数字で入力してください'
  validates :price, presence: true
  validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :state_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :fee_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_time_id, numericality: { other_than: 1 , message: "can't be blank"}

  has_many_attached :images
  belongs_to :user
  belongs_to :category
  belongs_to :prefecture
  belongs_to :state
  belongs_to :fee
  belongs_to :delivery_time
  has_one :purchase
end
