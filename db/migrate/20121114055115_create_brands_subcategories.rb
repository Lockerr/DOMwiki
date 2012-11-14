class CreateBrandsSubcategories < ActiveRecord::Migration
def change
    create_table :brands_subcategories do |t|
      t.references :brand, :subcategory
    end
    add_index :brands_subcategories, [:brand_id, :subcategory_id]
  end
end
