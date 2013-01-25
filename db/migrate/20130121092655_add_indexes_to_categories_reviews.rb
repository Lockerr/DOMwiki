class AddIndexesToCategoriesReviews < ActiveRecord::Migration
  def change
    add_index :categories_reviews,  [:category_id, :review_id]
    add_index :categories_reviews,  [:review_id, :category_id]
  end
end
