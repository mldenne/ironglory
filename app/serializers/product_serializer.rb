class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :sku, :price, :inventory, :year, :description

  belongs_to :category

  has_many :orders, through: :orderings
  has_many :reviews

end
