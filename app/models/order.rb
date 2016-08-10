class Order < ApplicationRecord

  belongs_to :can_order, polymorphic: true
  belongs_to :shipping_address
  belongs_to :billing_address
  belongs_to :order_status

  # before_create :set_order_status

  # before_save :update_total_order_price

  has_many :products, through: :orderings
  has_many :orderings

  def total_order_price
      order_price = 0
      orderings.each do |ordering|
        order_price += ordering.total_ordering_price
      end
    order_price
  end

  def total_objects
    order_objects = 0
    orderings.each do |ordering|
      order_objects += ordering.quantity
    end
    order_objects
  end

  private

  # def set_order_status
  #   self.order_status_id = 1
  # end
  #
  # def update_total_order_price
  #   self[:total_order_price]
  # end


end
