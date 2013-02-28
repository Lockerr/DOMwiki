class AddFeedToBrandsCategories < ActiveRecord::Migration
  def change
    add_column :brands_categories, :feed, :boolean
  end
end
