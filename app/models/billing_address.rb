class BillingAddress < ApplicationRecord

  belongs_to :can_be_billed, polymorphic: true

  has_many :orders

end
