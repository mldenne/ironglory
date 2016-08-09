class Order < ApplicationRecord

  belongs_to :user
  belongs_to :guest
  belongs_to :shipping_addresses
  belongs_to :billing_addresses

  has_many :products, through: :orderings

end
