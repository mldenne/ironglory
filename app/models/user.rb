class User < ApplicationRecord

  has_secure_password

  has_many :shipping_address
  has_many :billing_address
  has_many :reviews

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :shipping_address, presence: true
  validates :billing_address, presence: true

end
