class CreateModelsRubrics < ActiveRecord::Migration
  def change
    create_table :models_rubrics do |t|
      t.references :model, :rubric
    end
    add_index :models_rubrics, [:model_id, :rubric_id]
  end
end
