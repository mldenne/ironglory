class OrderSerializer < ActiveModel::Serializer
  attributes :id, :order_number

  belongs_to :can_order, polymorphic: true
  belongs_to :shipping_address
  belongs_to :billing_address

  has_many :products, through: :orderings
  has_many :orderings
  
end
