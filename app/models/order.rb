class Order < ApplicationRecord

  belongs_to :can_order, polymorphic: true
  belongs_to :shipping_address
  belongs_to :billing_address

  has_many :products, through: :orderings
  has_many :orderings

  def total_order_price
      order_price = 0
      orderings.each do |ordering|
        order_price += ordering.total_ordering_price
      end
    order_price
  end

end
