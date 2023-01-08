class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_many_attached :images
  belongs_to :user
  belongs_to :category
  belongs_to :prefecture
  belongs_to :state
  belongs_to :fee
  belongs_to :delivery_time
  has_one :purchase
end
