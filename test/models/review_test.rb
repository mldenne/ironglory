require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  should belong_to(:product)
  should belong_to(:can_review)
end
