class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :sku, :price, :inventory, :year, :description, :product_image, :category_name
  has_many :reviews
  has_one :product_image

  def product_image
    Refile.attachment_url(object, :product_image, :fit, 400, 400)
  end

  def price
    '%.2f' % (object[:price].to_i/100.0)
  end

  def category_name
    object.category.name
  end

end
