class Product < ApplicationRecord
  belongs_to :category
  has_many :orders, through: :orderings
  has_many :orderings
  has_many :reviews
  attachment :product_image, type: :image

end
