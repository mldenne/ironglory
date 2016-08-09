class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :body

  belongs_to :can_review
  belongs_to :product

end
