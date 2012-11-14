class CreateBrandsRubrics < ActiveRecord::Migration
def change
    create_table :brands_rubrics do |t|
      t.references :brand, :rubric
    end
    add_index :brands_rubrics, [:brand_id, :rubric_id]
  end
end
