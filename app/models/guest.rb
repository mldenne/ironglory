class Guest < ApplicationRecord
  has_many :orders, as: :can_order
  has_many :shipping_addresses, as: :can_be_shipped_to
  has_many :billing_addresses, as: :can_be_billed
  has_many :reviews, as: :can_review
  before_validation :set_guest_num
  validates :guest_num, presence: true, uniqueness: true

  def set_guest_num
    self.guest_num = SecureRandom.hex(10)
  end

end
