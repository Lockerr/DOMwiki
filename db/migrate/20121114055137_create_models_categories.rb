class CreateModelsCategories < ActiveRecord::Migration
  def change
    create_table :models_categories do |t|
      t.references :model, :category
    end
    add_index :models_categories, [:model_id, :category_id]
  end
end
