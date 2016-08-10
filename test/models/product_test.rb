require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  should belong_to(:category)
  should have_many(:orders)
  should have_many(:reviews)
end
