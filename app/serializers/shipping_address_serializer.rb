class ShippingAddressSerializer < ActiveModel::Serializer
  attributes :id, :street_address, :city, :state, :zipcode
end
