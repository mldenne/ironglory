require 'test_helper'

class OrderingTest < ActiveSupport::TestCase
  should belong_to(:order)
  should belong_to(:product)
end
