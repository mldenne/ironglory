class ShippingAddress < ApplicationRecord

  belongs_to :can_be_shipped_to, polymorphic: true

  has_many :orders

end
