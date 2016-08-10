class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :featured_picture
  has_many :products

  def featured_picture
    products.where(featured: true).first.product_image
  end
end
