require 'test_helper'

class BillingAddressTest < ActiveSupport::TestCase
  should belong_to(:can_be_billed)
  should have_many(:orders)
end
