class User < ApplicationRecord

  has_secure_password

  has_many :orders, as: :can_order
  has_many :shipping_addresses, as: :can_be_shipped_to
  has_many :billing_addresses, as: :can_be_billed
  has_many :reviews, as: :can_review

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :firstname, presence: true
  validates :lastname, presence: true

end
