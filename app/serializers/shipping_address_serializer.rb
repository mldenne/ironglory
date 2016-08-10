class ShippingAddressSerializer < ActiveModel::Serializer
  attributes :id, :street_address, :city, :state, :zipcode

  belongs_to :can_be_shipped_to, polymorphic: true

  has_many :orders

end
