class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :sku, :price, :inventory, :year, :description
  belongs_to :category
  has_many :orders, through: :orderings
  has_many :reviews
  has_one :product_image
  # has_one :other_sizes

  def product_image
    Refile.attachment_url(object, :product_image)
  end
  # def other_sizes
  # image_array = []
  # image_array << {five_hundred: Refile.attachment_url(object, :image, :fit, 500, 500)}
  # image_array << {one_thousand: Refile.attachment_url(object, :image, :fit, 1000, 1000)}
  # image_array << {fifty_profile: Refile.attachment_url(object, :image, :limit, 50, 50)}
  # image_array
  # end

end
