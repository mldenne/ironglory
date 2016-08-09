require 'test_helper'

class OrderTest < ActiveSupport::TestCase
should belong_to(:can_order)
should belong_to(:shipping_address)
should belong_to(:billing_address)
should have_many(:products)
should have_many(:orderings)
end
