class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_many_attached :images
  belongs_to :user
  belongs_to :category
  belongs_to :prefecture
  belongs_to :state
  belongs_to :fee
  belongs_to :delivery_time
  has_many :product_tag_relations
  has_many :tags, through: :product_tag_relations
  has_one :purchase
end
