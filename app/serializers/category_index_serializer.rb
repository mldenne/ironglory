class CategoryIndexSerializer < ActiveModel::Serializer
  attributes :id, :name
  #need featured_pic ^^

  # def featured_pic
  #   Refile.attachment_url(object.products.where(featured: true).first, :product_image, :fit, 400, 400)
  # end
end
