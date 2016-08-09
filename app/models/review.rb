class Review < ApplicationRecord

  belongs_to :product
  belongs_to :can_review, polymorphic: true

end
