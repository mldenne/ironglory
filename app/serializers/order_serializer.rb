class OrderSerializer < ActiveModel::Serializer
  attributes :id, :order_number

  belongs_to :can_order
  belongs_to :shipping_address
  belongs_to :billing_address

  has_many :orderings

end
