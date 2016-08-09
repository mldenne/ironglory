class MakeReviewsPolymorphic < ActiveRecord::Migration[5.0]
  def change
    rename_column :reviews, :user_id, :can_review_id
    add_column :reviews, :can_review_type, :string
  end
end
