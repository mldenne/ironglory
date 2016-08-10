require 'test_helper'

class ShippingAddressTest < ActiveSupport::TestCase
  should belong_to(:can_be_shipped_to)
  should have_many(:orders)
end
