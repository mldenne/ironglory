class Ordering < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :quantity, presence: true
  validate :product_present
  validate :order_present

  before_save :finalize

  def unit_price
    if persisted?
      self.[:unit_price]
    else
      product.price
    end
  end

  def total_ordering_price
    product.price * quantity
  end

  private

  def product_present
    if product.nil?
      errors.add(:product, "Inventory not available for this patch")
    end
  end

  def order_present
    if order.nil?
      errors.add(:order, "Your cart is empty, please select item to order")
    end
  end

  def finalize
    self[:unit_price] = unit_price
    self[:total_price] = quantity * self[:unit_price]
  end

  end
end
