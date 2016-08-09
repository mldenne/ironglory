class Ordering < ApplicationRecord
  belongs_to :order
  belongs_to :product

  def total_ordering_price
    product.price * quantity
  end
end
