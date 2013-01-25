class CreateItemsReviews < ActiveRecord::Migration
  def change
    create_table :items_reviews, id: false do |t|
      t.integer :item_id
      t.integer :review_id
    end
  end
end
