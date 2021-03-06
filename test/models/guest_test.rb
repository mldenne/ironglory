require 'test_helper'

class GuestTest < ActiveSupport::TestCase
  should have_many(:orders)
  should have_many(:shipping_addresses)
  should have_many(:billing_addresses)
  should have_many(:reviews)
end
