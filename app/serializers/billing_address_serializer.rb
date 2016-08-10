class BillingAddressSerializer < ActiveModel::Serializer
  attributes :id, :street_address, :city, :state, :zipcode

  belongs_to :can_be_billed, polymorphic: true

  has_many :orders

end
