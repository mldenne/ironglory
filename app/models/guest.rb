class Guest < ApplicationRecord
  has_many :orders, as: :can_order
  has_many :shipping_addresses, as: :can_be_shipped_to
  has_many :billing_addresses, as: :can_be_billed
  has_many :reviews, as: :can_review
end
