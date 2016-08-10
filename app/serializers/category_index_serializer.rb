class CategoryIndexSerializer < ActiveModel::Serializer
  attributes :id, :name, :featured_picture

  def featured_picture
    products.where(featured: true).first.product_image
  end
end
