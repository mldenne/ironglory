class User < ApplicationRecord

  has_secure_password

  has_many :orders
  has_many :shipping_addresses
  has_many :billing_addresses
  has_many :reviews

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :firstname, presence: true
  validates :lastname, presence: true

end
