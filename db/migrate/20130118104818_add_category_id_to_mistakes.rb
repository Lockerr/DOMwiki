class AddCategoryIdToMistakes < ActiveRecord::Migration
  def change
    add_column :mistakes, :category_id, :integer
  end
end
