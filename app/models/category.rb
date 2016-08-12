class Category < ApplicationRecord
  has_many :products

  def featured_product
    products.where(featured: true).first
  end
end
