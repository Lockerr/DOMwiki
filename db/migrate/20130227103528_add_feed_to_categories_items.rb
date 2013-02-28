class AddFeedToCategoriesItems < ActiveRecord::Migration
  def change
    add_column :categories_items, :feed, :boolean

  end
end
