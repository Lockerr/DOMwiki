class CreateModelsSubcategories < ActiveRecord::Migration
  def change
    create_table :models_subcategories do |t|
      t.references :model, :subcategory
    end
    add_index :models_subcategories, [:model_id, :subcategory_id]
  end
end
