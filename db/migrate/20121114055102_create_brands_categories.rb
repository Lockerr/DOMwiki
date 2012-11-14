class CreateBrandsCategories < ActiveRecord::Migration
  def change
    create_table :brands_categories do |t|
      t.references :brand, :category
    end
    add_index :brands_categories, [:brand_id, :category_id]
  end

  
end
