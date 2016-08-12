class OrderingSerializer < ActiveModel::Serializer
  attributes :id, :quantity

  has_many :product

  def product
    object.product
  end


end
